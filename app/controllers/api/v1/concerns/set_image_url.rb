# Carrierwaveのuploader側をpathを通すことができたので仮削除

# require "active_support/concern"
# require 'uri'

# module Api::V1::Concerns
#   module SetImageUrl
#     extend ActiveSupport::Concern

#     # ここのpathは本番環境で変わるので要修正
#     DOMAIN = Rails.env.production? ? "http://localhost:3010" : "http://localhost:3010"

#     # 内部結合等でくっつけたurlはcarrierwaveは感知しないためurlを作成する必要がある
#     # avatarのurlをfullpathで返却するために加工
#     # records_array: ActiveRecordRelation or Array
#     def set_avatar_img_url(records_array)
#       return records_array if records_array.blank?

#       block = set_avatar_img_url_block(records_array)
#       raise StandardError.new("\'set_avatar_img_url\' method can't handle #{records_array.first.class} class") if !block

#       records_array = records_array.map &block
#     end

#     private

#     def set_avatar_img_url_block(records_array)
#       case records_array.first
#       when VendorOffer then
#         block = proc do |obj|
#           if obj.avatar
#             obj.avatar = { url: "#{DOMAIN}/uploads/vendor_user/avatar/#{obj.vendor_user_id}/#{URI.encode_www_form_component(obj.avatar)}" }
#           end
#           obj
#         end
#       when VendorOfferChat then
#         block = proc do |obj|
#           if obj.avatar
#             if obj.user_id
#               obj.avatar = { url: "#{DOMAIN}/uploads/user/avatar/#{obj.user_id}/#{URI.encode_www_form_component(obj.avatar)}" }
#             end
#             if obj.vendor_user_id
#               obj.avatar = { url: "#{DOMAIN}/uploads/vendor_user/avatar/#{obj.vendor_user_id}/#{URI.encode_www_form_component(obj.avatar)}" }
#             end
#           end
#           obj
#         end
#       end
#       block
#     end
#   end
# end