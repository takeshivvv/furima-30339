FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    info {"あ1@;;lf45,./s-^"}
    category_id {3}
    status_id {4}
    shipping_fee_id {2}
    shipping_area_id {2}
    day_to_ship_id {2}
    price {9999999}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
