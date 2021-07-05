class OrderDestination
  include ActiveModel::Model
  attr_accessor :zip, :shipping_area_id, :city, :block, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
  end
  validates :shipping_area_id, numericality {other_than: 1}
  validates :phone_number, numericality format: {with: /\A\d{10,11}\z/, message: "is invalid. Input half-width numeric characters(10 or 11 digits)."}
  end
end