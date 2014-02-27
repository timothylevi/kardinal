class PetitionsController < ApplicationController
  before_filter :require_logged_in, only: [:new, :create]

  def index
    @petitions = Petition.get_non_victories.limit(10)
    @causes = Cause.order(:name)
    @last_viewed = Petition.find(session[:last_viewed])
  end

  def show
    @petition = Petition.includes(:recipients, creator: :contact_details).find(params[:id])

    session[:last_viewed] = @petition.id
    @creator = @petition.creator
    @petition_signature = PetitionSignature.find_single(current_user, @petition) || PetitionSignature.new
    @victory = Victory.find_by_petition_id(@petition.id) || Victory.new
  end

  def new
    @petition = Petition.new
    @recipients = Recipient.order(:gov_state, :last_name)
  end

  def create
    @petition = Petition.new(params[:petition])
    @recipients = Recipient.order(:gov_state, :last_name)

    if @petition.valid?

      current_user.petitions.build(params[:petition])
      current_user.save

      current_user.petitions.last.petition_signatures.create(user_id: current_user.id)
      flash[:notices] = ["Your petition was successfully created!"]
      redirect_to petition_url(current_user.petitions.last)
    else
      render :new
    end
  end

  def edit
    @petition = Petition.find(params[:id])
    @creator = @petition.creator
    @recipients = Recipient.order(:gov_state, :last_name)

    if current_user != @creator
      flash[:errors] = ["You can only edit petitions you've created."]
      redirect_to @petition
    end
  end

  def update
    @petition = Petition.find(params[:id])
    @recipients = Recipient.order(:gov_state, :last_name)

    if @petition.update_attributes(params[:petition])
      flash[:notices] = ["Your petition was successfully updated!"]
      redirect_to @petition
    else
      render :edit
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy

    flash[:notices] = ["Your petition was successfully deleted."]
    redirect_to me_url
  end
end
