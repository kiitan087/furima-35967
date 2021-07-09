FactoryBot.define do
  factory :order_destination do
    token             { 'tok_abcdefghijk00000000000000000' }
    zip               { '123-4567' }
    shipping_area_id  { Faker::Number.between(from: 2, to: 48) }
    city              { '横浜' }
    block             { '川崎' }
    building          { '横須賀' }
    phone_number      { '09012345678' }
  end
end
