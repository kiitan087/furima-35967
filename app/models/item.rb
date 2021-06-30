class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_change
  belongs_to :shipping_area
  belongs_to :delivery_time
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product
    validates :product_description
    validates :category_id
    validates :status_id
    validates :delivery_change_id
    validates :shipping_area_id
    validates :delivery_time_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_change_id
    validates :shipping_area_id
    validates :delivery_time_id
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numeric characters.' }
end
