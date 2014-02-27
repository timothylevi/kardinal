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

  def demo
    user = User.find_by_email("demo@example.com")

    unless user
      user = User.create!(
        name: Faker::Name.name,
        password: "password",
        email: "demo@example.com",
        image: "http://placekitten.com/600/600")

      user.contact_details.create!(
        zip: 10003,
        website: "http://kardinal.herokuapp.com",
        city: "New York",
        state: "NY",
        country: "United States of America",
        description: "I was created as a demo for kardinal! Feel free to edit this info and play around!")
    else
      user.contact_details.first.update_attributes(
        description: "I was created as a demo for kardinal! Feel free to edit this info and play around!")

    end

    login(user)
    flash[:notices] = ["Thanks for logging in to the demo account!"]
    redirect_to me_url
  end
end
