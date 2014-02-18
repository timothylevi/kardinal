class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def create_user(user, contact)
    user.save && user.contact_details.create(contact)

    return user
  end
end