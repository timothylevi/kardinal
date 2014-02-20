class RecipientsController < ApplicationController
  def new
    @recipient = Recipient.new
    @contact_detail = ContactDetail.new
  end

  def create
    @recipient = Recipient.new(params[:recipient])
    @recipient.creator_id = current_user.id
    @contact_detail = ContactDetail.new(params[:contact_detail])

    if @recipient.save &&
      @recipient.contact_details.create(params[:contact_detail])
      flash[:notices] = "#{@recipient.first_name} #{@recipient.last_name} was successfully saved!"

      redirect_to new_petition_url
    else
      @contact_detail = @recipient.contact_details.new(params[:contact_detail])
      @contact_detail.valid?

      render :new
    end
  end
end
