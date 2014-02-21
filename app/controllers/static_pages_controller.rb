class StaticPagesController < ApplicationController
  def root
    @user = User.new
    @petitions = Petition.includes(:creator, :petition_signatures)
            .order("created_at DESC")
            .where(is_victory: false)
            .limit(10)
    @victories = Victory.includes(petition: [:creator, :petition_signatures])
            .limit(5)
  end
end
