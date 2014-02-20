class PetitionsController < ApplicationController
  def index
    @petitions = Petition.get_non_victories # Petition.includes(:signatures)
  end

  def show
    @petition = Petition.includes(creator: :contact_details).find(params[:id])
    @creator = @petition.creator
    @petition_signature = PetitionSignature.find_single(current_user.id, @petition.id) || PetitionSignature.new
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(params[:petition])


    if @petition.valid?

      current_user.petitions.build(params[:petition])
      current_user.save
      flash[:notices] = "Your petition was successfully created!"
      redirect_to petition_url(current_user.petitions.last)
    else
      render :new
    end
  end

  def edit
    @petition = Petition.find(params[:id])
    @creator = @petition.creator

    if current_user != @creator
      flash[:show] = "You can only edit petitions you've created."
      redirect_to @petition
    end
  end

  def update
    @petition = Petition.find(params[:id])

    if @petition.update_attributes(params[:petition])
      flash[:notices] = "Your petition was successfully updated!"
      redirect_to @petition
    else
      render :edit
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy

    flash[:notices] = "Your petition was successfully deleted."
    redirect_to me_url
  end
end
