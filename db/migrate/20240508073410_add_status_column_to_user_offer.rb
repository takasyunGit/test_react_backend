class AddStatusColumnToUserOffer < ActiveRecord::Migration[6.1]
  def change
    add_column :user_offers, :status, :integer, default: 1, index: true
  end
end
