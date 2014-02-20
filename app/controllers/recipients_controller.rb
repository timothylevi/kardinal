class RecipientsController < ApplicationController
  def new
    @recipient = Recipient.new
  end
end
