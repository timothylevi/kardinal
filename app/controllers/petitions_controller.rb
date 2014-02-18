class PetitionsController < ApplicationController
  def index
    @petitions = Petition.all
  end

  def show
    @petition = Petition.find(params[:id])
    @creator = @petition.creator
  end
end
