class Api::V1::User::VendorOffersController < ApplicationController
  NUMBER_OF_PER_PAGE = 10

  before_action :authenticate_api_v1_user!

  def index
    @objects = VendorOffer
      .select(
        <<~SQL.gsub(/\n/," ")
          vendor_offers.*,
          users.name,
          vendors.name as vendor_name,
          vendor_users.name as vendor_user_name,
          vendor_users.avatar as avatar
        SQL
      ).joins(user_offer: :user)
      .joins(vendor_user: :vendor)
      .where(user_offer_id: params[:user_offer_id])
      .where("user_offers.user_id": current_user.id)
    @objects = @objects.paginate_order(params[:key_id], "desc", NUMBER_OF_PER_PAGE, "updated_at")

    render json: { data: @objects }
  end

  def show
    from_table = VendorOffer.where(id: params[:id])
    @object = VendorOffer
      .select("vendor_offers.*, users.name")
      .from(from_table, :vendor_offers)
      .joins(user_offer: :user)
      .where("user_offers.user_id": current_user.id)
    @images = @object.first.vendor_offer_images
    if @object
      render json: { data: { vendor_offer: @object.first, images: @images } }
    else
      render_404
    end
  end
end
