class Api::V1::User::UserOffersController < ApplicationController
  before_action :authenticate_user!

  def index
    drafts = UserOffer.where(user_id: current_user.id, status: USER_OFFER_STATUS_DRAFT).order(created_at: :desc)
    proposals = UserOffer.where(user_id: current_user.id, status: [USER_OFFER_STATUS_PROPOSAL, USER_OFFER_STATUS_OVERDUE]).order(status: :asc).order(deadline: :desc)
    finished = UserOffer.where(user_id: current_user.id, status: USER_OFFER_STATUS_FINISHED).order(deadline: :desc)
    @object = { draft: drafts, proposal: proposals, finished: finished }

    render json: { data: @object }
  end

  def show
    from_table = UserOffer.where(user_id: current_user.id, id: params[:id])
    @object = UserOffer
      .select("user_offers.*, users.name")
      .from(from_table, :user_offers)
      .joins(:user)
    if @object
      render json: { data: @object.first }
    else
      render_404
    end
  end

  def create
    @object = current_user.user_offers.new(user_offer_params)
    @object.status = USER_OFFER_STATUS_PROPOSAL
    @object.save!
    render json: { data: @object }
  end

  private

  def user_offer_params
    params.require(:user_offer).permit(:prefecture, :address, :budget, :remark, :request_type, :deadline, {images: []})
  end
end
