class PetitionSignaturesController < ApplicationController
  before_filter :require_logged_in

  def create
    petition_id = params[:petition_id].to_i
    petition_signature = PetitionSignature.create(
      user_id: current_user.id,
      petition_id: petition_id)

    flash[:notice] = "Thank you for signing!"
    redirect_to petition_url(petition_id)
  end
end
