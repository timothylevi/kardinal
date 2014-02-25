class ActivationMailer < ActionMailer::Base
  default from: "Kardinal <welcome@kardinal.com>"

  def signup_email(user)
    @user = user
    @url = "http://kardinal.herokuapp.com/activate/#{user.activation_token}"
    mail(
      to: "#{user.name} <#{user.email}>",
      subject: "Welcome to Kardinal!"
    )
  end
end
