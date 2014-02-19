class VictoriesController < ApplicationController
  def index
    @victories = Victory.includes(petition: [:creator, :petition_signatures])
  end

  def create
    petition = Petition.find(params[:petition_id])
    petition.create_victory(params[:victory])

    flash[:notice] = "Congratulations on your victory!"
    redirect_to petition_url(petition)
  end
end
