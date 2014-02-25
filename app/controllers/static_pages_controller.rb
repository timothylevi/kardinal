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

  def activate
    @user = User.find_by_activation_token(params[:token])

    puts; puts
    puts @user
    puts params[:token]
    puts; puts

    if @user
      @user.update_attributes(activated: "t")
      @user.reset_activation_token!
      login(@user)
      redirect_to root_url
    end
  end
end
