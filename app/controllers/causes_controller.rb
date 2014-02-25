class CausesController < ApplicationController
  def show
    @cause = Cause.find_by_name(params[:id]) || Cause.find(params[:id])

    @petitions = @cause.petitions
  end
end
