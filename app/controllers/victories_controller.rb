class VictoriesController < ApplicationController
  def index
    @victories = Victory.includes(petition: [:creator, :petition_signatures]).limit(10)
    @causes = Cause.order(:name)
  end

  def create
    petition = Petition.find(params[:petition_id])
    petition.create_victory(params[:victory])
    petition.update_attributes(is_victory: true)

    flash[:warning] = ["Congratulations on your victory!"]
    redirect_to petition_url(petition)
  end
end
