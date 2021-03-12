class BuyerForm
  include ActiveModel::Model
  attr_accessor :user_id,:item_id, :postal_code,:shipping_area_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code
    validates :shipping_area_id
    validates :city
    validates :addresses
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  with_options numericality: { other_than: 1 } do
    validates :shipping_area_id
  end

  validates :phone_number, numericality: { message: "数字のみ登録可"}
  validates :phone_number, length: {maximum: 11}
  
  
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "ハイフンが必要である"}
  
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code,shipping_area_id: shipping_area_id, city: city, addresses: addresses, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end

