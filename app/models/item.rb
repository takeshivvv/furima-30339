class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

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
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :shipping_area
  belongs_to :shipping_fee
  belongs_to :status

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :day_to_ship_id
  validates :shipping_area_id
  validates :shipping_fee_id
  validates :status_id
  
  end
  
  
 

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  validates :price, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}


end



