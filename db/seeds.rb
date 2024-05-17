ActiveRecord::Base.transaction do
  user = User.create!(
    name: "rails",
    email: "rails@rails.rails",
    password: "Password",
    password_confirmation: "Password",
    avatar: File.open(Rails.root.join("public/seed/rails_user_avatar.jpg"))
  )

  other = User.create!(
    name: "other",
    email: "other@other.other",
    password: "Password",
    password_confirmation: "Password"
  )

  vendor = Vendor.create!(
    name: "test株式会社",
    prefecture: 13,
    address: "新宿区西新宿二丁目８番１号",
    capital: 1000
  )

  vendor_other = Vendor.create!(
    name: "その他株式会社",
    prefecture: 11,
    address: "さいたま市浦和区高砂３丁目１５−１",
    capital: 100
  )

  vendor_user = VendorUser.create!(
    vendor_id: vendor.id,
    name: "react",
    email: "react@react.react",
    password: "Password",
    password_confirmation: "Password",
    avatar: File.open(Rails.root.join("public/seed/vendor_user_avatar.jpg"))
  )

  other_vendor_user = VendorUser.create!(
    vendor_id: vendor_other.id,
    name: "react",
    email: "other@other.other",
    password: "Password",
    password_confirmation: "Password",
    avatar: File.open(Rails.root.join("public/seed/other_vendor_avatar.jpg"))
  )

  user_offer = user.user_offers.create!(
    prefecture: 13,
    address: "調布市小島町２丁目３５番地１",
    budget: 35000000,
    remark: "コンセプト
・家族でリビングでゆっくりすごしたい
・料理をよくするのでキッチンは広くてアイランドキッチンにしたい
・晴れた日には庭でBBQもしたいのでなるべく庭は広くとりたい
・キッチン、リビング、庭先が一体となるように視線が通るようにしたい",
    request_type: 1,
    deadline: "2024-12-26",
    status: 2,
    images: [File.open(Rails.root.join("public/seed/island_kitchen.jpg"))]
  )

  user_offer = user.user_offers.create!(
    prefecture: 13,
    address: "テスト市テスト町1-1-1",
    budget: 35000000,
    remark: "テスト",
    request_type: 2,
    deadline: "2024-02-26",
    status: 3
  )

  user_offer = user.user_offers.create!(
    prefecture: 13,
    address: "テスト市テスト町2-2-2",
    budget: 35000000,
    remark: "テスト",
    request_type: 3,
    deadline: "2023-12-26",
    status: 4
  )

  other.user_offers.create!(
    prefecture: 3,
    address: "盛岡市内丸１０−１",
    budget: 35000000,
    remark: "コンセプト
・アウトドア（キャンプ）が趣味なので道具を入れるための大きめの土間収納が欲しい
・ランドクルーザーなので駐車場は余裕をもって広めにしたい
・冬は薪ストーブをメインに暖をとりたい",
    request_type: 1,
    deadline: "2024-11-06",
    status: 2,
    images: [File.open(Rails.root.join("public/seed/outdoor_house.jpg"))]
  )

  10.times do |n|
    other.user_offers.create!(
      prefecture: 13,
      address: "さいたま市浦和区高砂３丁目１５−１",
      budget: 5000000,
      remark: "テスト要望",
      request_type: 2,
      deadline: "2024-11-06",
      status: 2
    )
  end

  vendor_offer = VendorOffer.create!(
    vendor_user_id: vendor_user.id,
    user_offer_id: user_offer.id,
    title: "家族の快適な暮らしを実現する建築設計の提案",
    estimate: 31000000,
    remark: "いつもお世話になっております、それぞれの要素を取り入れた素晴らしいプランをご提案いたします。\n
リビングを家族がゆっくり過ごすための心地よい空間とするために、広々とした間取りと自然光をたっぷり取り入れたデザインを考えています。リビングエリアは庭に直結し、開放的な雰囲気を演出します。\n
キッチンに関しては、お客様の料理をより楽しめるよう、広々としたアイランドキッチンを設置いたします。キッチンスペースはリビングとの一体感を保ちつつ、機能性と使いやすさを重視したデザインとなります。\n
また、庭でのBBQをお楽しみいただけるよう、広い庭スペースを確保し、リビング・キッチン・庭が一体となるように配置いたします。これにより、お料理中でも家族やゲストとのコミュニケーションがスムーズに行え、より心地よい時間を過ごしていただけます。\n
最後に、建物内外の視線が通るようにするために、開放的なデザインと広々とした窓を配置し、自然光や景色を最大限に活かした空間を演出いたします。\n
ご不明点やご要望がございましたら、お気軽にお知らせください。今後ともよろしくお願いいたします。"
  )
  vendor_offer.vendor_offer_images.create!(content: File.open(Rails.root.join("public/seed/sample1-1.gif")))
  vendor_offer.vendor_offer_images.create!(content: File.open(Rails.root.join("public/seed/sample1-2.gif")))

  other_offer = VendorOffer.create!(
    vendor_user_id: other_vendor_user.id,
    user_offer_id: user_offer.id,
    title: "家族の快適な暮らしを実現する建築プランについての提案",
    estimate: 32000000,
    remark: "いつもお世話になっております。お客様からいただいた要望を元に、家族が快適に過ごせるような設計を提案いたします。\n
リビングエリアではゆったりとくつろげる空間を確保するために、広々としたレイアウトを構築します。リビングとキッチンを一体化させることで、家族がコミュニケーションを取りながら過ごせるようにします。また、アイランドキッチンを採用することで、調理空間を中心に家族が集まりやすくなります。\n
庭は家族がリラックスしたりBBQを楽しむ場として重要です。そのため、庭をリビングとキッチンから見えるように配置し、一体感を演出します。庭の面積を広く取り、家族が快適に外で過ごせるようにしましょう。また、庭とリビング・キッチンをつなぐような大きな窓やスライディングガラスドアを設置することで、室内と屋外を自然につなげます。\n
視線が通るようにするためには、間取りや家具配置に工夫が必要です。開放的なレイアウトを採用し、家族が移動する際にも視界が遮られないようにします。また、建材や色彩の選定にも配慮し、空間全体が一体感を持つようにデザインします。\n
以上、提案させていただきましたが、ご要望やご質問がありましたらお気軽にお知らせください。お客様のご満足を第一に考え、最高の家づくりを実現できるよう努めます。\n
何卒よろしくお願い申し上げます。"
  )
  other_offer.vendor_offer_images.create!(content: File.open(Rails.root.join("public/seed/sample2-1.gif")))
  other_offer.vendor_offer_images.create!(content: File.open(Rails.root.join("public/seed/sample2-2.gif")))

  VendorOfferChat.create!(
    user_id: user.id,
    vendor_user_id: nil,
    vendor_offer_id: vendor_offer.id,
    message: "テストメッセージ"
  )
  VendorOfferChat.create!(
    user_id: nil,
    vendor_user_id: vendor_user.id,
    vendor_offer_id: vendor_offer.id,
    message: "テストメッセージ"
  )

  VendorOfferChat.create!(
    user_id: user.id,
    vendor_user_id: nil,
    vendor_offer_id: other_offer.id,
    message: "テストメッセージ"
  )
  VendorOfferChat.create!(
    user_id: nil,
    vendor_user_id: other_vendor_user.id,
    vendor_offer_id: other_offer.id,
    message: "テストメッセージ"
  )
end
