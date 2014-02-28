class StaticPagesController < ApplicationController
  def root
    @user = User.new
    @petitions = Petition.includes(:creator, :petition_signatures)
            .order("created_at DESC")
            .where(is_victory: false)
            .limit(5)
    @victories = Victory.includes(petition: [:creator, :petition_signatures])
            .limit(5)
    @causes = Cause.all
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
      petition = user.petitions.create!(
        title: "Justice for Kwadir Felton",
        background: "The Jersey City Police Department and Judicial System has stripped a young man of his life and independence, not once, but twice. Kwadir Felton has been charged with six charges of conspiracy. Though there is no strong evidence of his involvement in any drug conspiracy he will be facing 30 years and with a possibility of parole after 15 years. Kwadir was shot in the head by undercover police officers, which lead to a permanent loss of his eyesight. The police officer has not been indicted of any charges because of this. Instead, he has been demoted from Detective to a Blue suit officer. The courts are taking the word of one man as the truth, when his truth could be a fabricated lie to protect his reputation and job. The Jersey City Police Department has not taken any responsibility for crippling a man and wrongfully incarcerating him without irrefutable proof of guilt.",
        body: "Justice for Kwadir Felton !!!!",
        image: "http://imgick.nj.com/home/njo-media/pgmain/img/jersey-journal/photo/2013/11/-b6482708df9c7230.jpg",
        cause_ids: [Cause.find_by_name("criminal_justice").id]
        )
    else
      user.contact_details.first.update_attributes(
        description: "I was created as a demo for kardinal! Feel free to edit this info and play around!")

    end

    login(user)
    flash[:notices] = ["Thanks for logging in to the demo account!"]
    redirect_to me_url
  end
end
