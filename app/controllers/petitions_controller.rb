class PetitionsController < ApplicationController
  def index
    @petitions = Petition.all
  end

  def show
    @petition = Petition.find(params[:id])
    @creator = @petition.creator
  end

  def new
    @petition = Petition.new
  end

  def create
    current_user.petitions.build(params[:petition])

    if current_user.save
      flash[:notices] = "Petition saved!"
      redirect_to petition_url(current_user.petitions.last)
    else
      @petition = Petition.new(params[:petition])
      @petition.valid?

      render :new
    end
  end
end
