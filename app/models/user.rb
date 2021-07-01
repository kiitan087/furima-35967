class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/,
                        message: 'is invalid. Input half-width alphanumeric mixed characters.' }
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :nickname
    validates :birthday
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is invalid. Input '@' character." }
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
    validates :last_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  has_many :items
end
