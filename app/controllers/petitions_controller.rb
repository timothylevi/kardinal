class PetitionsController < ApplicationController
  before_filter :require_logged_in, only: [:new, :create]

  def index
    @petitions = Petition.includes(:creator, :petition_signatures)
            .order("created_at DESC")
            .where(is_victory: false)
            .page(params[:page])
    @causes = Cause.order(:name)
    @last_viewed = Petition.find(session[:last_viewed]) if session[:last_viewed]
    @victories = Victory.includes(petition: [:creator, :petition_signatures])
            .limit(5)
    @featured_petitions = ::Petition.includes(:creator, :petition_signatures).order('created_at DESC').limit(3)
    @top_comments = ::Comment.order('rating DESC').limit(3)
  end

  def show
    @petition = Petition.includes(:recipients, creator: :contact_details).find(params[:id])

    session[:last_viewed] = @petition.id
    @creator = @petition.creator
    @petition_signature = PetitionSignature.find_single(current_user, @petition) || PetitionSignature.new
    @victory = Victory.find_by_petition_id(@petition.id) || Victory.new
    @organization = @petition.organization
  end

  def embedded
    @embedded = true
    self.show
    response.headers['X-Frame-Options'] = 'ALLOWALL'
    render template: 'petitions/show', layout: false
  end

  def new
    @petition = Petition.new
    @recipients = Recipient.order(:gov_state, :last_name)
  end

  def create
    @petition = Petition.new(petition_params)
    @recipients = Recipient.order(:gov_state, :last_name)

    if @petition.valid?
      create_and_sign_petition(petition_params)

      session[:recipient_id] = nil

      flash[:notices] = ["Your petition was successfully created!"]

      ::Helpers::Rating.update(@petition.creator, :petition_added)
      redirect_to petition_url(current_user.petitions.last)
    else
      render :new
    end
  end

  def edit
    @petition = Petition.find(params[:id])
    @creator = @petition.creator
    @recipients = Recipient.order(:gov_state, :last_name)

    if current_user != @creator
      flash[:errors] = ["You can only edit petitions you've created."]
      redirect_to @petition
    end
  end

  def update
    @petition = Petition.find(params[:id])
    @recipients = Recipient.order(:gov_state, :last_name)

    if @petition.update_attributes(petition_params)
      flash[:notices] = ["Your petition was successfully updated!"]
      redirect_to @petition
    else
      render :edit
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy

    flash[:notices] = ["Your petition was successfully deleted."]
    redirect_to me_url
  end

  private

  def petition_params
    params.require(:petition).permit(:cause_ids, :goal, :title, :background, :body, :is_victory, :image, :recipient_ids, :approved)
  end
end
