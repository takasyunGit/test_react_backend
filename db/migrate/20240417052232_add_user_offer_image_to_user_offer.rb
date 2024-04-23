class AddUserOfferImageToUserOffer < ActiveRecord::Migration[6.1]
  def change
    add_column :user_offers, :images, :json
  end
end
