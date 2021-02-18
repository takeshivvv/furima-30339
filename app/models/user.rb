class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_date
  end

  has_many :items
  has_many :buyers

  with_options presence: true do
    validates :last_name,:first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :last_name_kana,:first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Input number and alphabet characters."}
  end
end
