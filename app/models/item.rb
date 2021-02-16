class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :day_to_ship_id
    validates :price
    validates :image

  end

  belongs_to :user
  has_one    :buyer
  has_one_attached :image
  has_many :category
  has_many :day_to_ship
  has_many :shipping_area
  has_many :shipping_fee
  has_many :status

  validates :category_id, numericality: { other_than: 1 }
  validates :day_to_ship_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :price, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999  } 
  validates :price, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
end



