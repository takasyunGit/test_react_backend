class VendorOfferChat < ApplicationRecord
  MAXIMUM_MESSAGE_LENGTH = 2000

  mount_uploader :avatar, AvatarUploader

  belongs_to :vendor_offer

  validates :vendor_offer_id, presence: true
  validates :message, length: { maximum: MAXIMUM_MESSAGE_LENGTH }
end
