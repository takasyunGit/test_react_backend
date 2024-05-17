class Api::V1::VendorUser::UserOffersController < ApplicationController
  before_action :authenticate_api_v1_vendor_user!

  def index
    UserOffer.mount_uploader(:avatar, AvatarUploader)

    my_proposal_offer = UserOffer
      .select(
        <<~SQL.gsub(/\n/," ")
          user_offers.*,
          users.name as user_name,
          users.avatar as avatar
        SQL
      )
      .joins(
        <<~SQL.gsub(/\n/," ")
          INNER JOIN
            (SELECT * FROM vendor_offers WHERE vendor_user_id = #{current_api_v1_vendor_user.id}) as my_offers
          ON
            my_offers.user_offer_id = user_offers.id
          INNER JOIN
            users
          ON
            users.id = user_offers.user_id
        SQL
      ).order(status: :asc).order(deadline: :desc)
    not_touched_offers = UserOffer
      .select(
        <<~SQL.gsub(/\n/," ")
          user_offers.*,
          users.name as user_name,
          users.avatar as avatar
        SQL
      )
      .joins(:user)
      .where(status: USER_OFFER_STATUS_PROPOSAL)
      .where.not(id: my_proposal_offer.ids)
      .order(status: :asc).order(deadline: :desc)
    @object = { proposal: my_proposal_offer, not_touched_offers: not_touched_offers }

    render json: { data: @object }
  end

  def show
    from_table = UserOffer.where(id: params[:id])
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
end
