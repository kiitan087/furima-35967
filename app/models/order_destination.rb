class OrderDestination
  include ActiveModel::Model
  attr_accessor :zip, :shipping_area_id, :city, :block, :building, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :token
  end
  validates :shipping_area_id, numericality: {other_than: 1}
  validates :phone_number, numericality: {with: /\A\d{10,11}\z/, message: "is invalid. Input half-width numeric characters(10 or 11 digits)."}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(zip: zip, shipping_area_id: shipping_area_id, city: city, 
                       block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end