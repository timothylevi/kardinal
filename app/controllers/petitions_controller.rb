class PetitionsController < ApplicationController
  def index
    @petitions = Petition.all
  end
end
