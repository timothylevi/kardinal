class CausesController < ApplicationController
  def show
    @cause = Cause.find_by_name(params[:id]) || Cause.find(params[:id])
    @causes = Cause.all
    @petitions = @cause.petitions
    @victories = Victory.includes(petition: [:creator, :petition_signatures])
            .limit(5)
  end
end
