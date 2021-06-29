class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :category
    validates :status
    validates :delivery_change
    validates :shipping_area
    validates :delivery_time
  end

  with_options numericality: { other_than: 1 } do
    validates :category
    validates :status
    validates :delivery_change
    validates :shipping_area
    validates :delivery_time
  end
end

