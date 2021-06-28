FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {"花子"}
    first_name            {"佐藤"}
    last_name_kana        {"ハナコ"}
    first_name_kana       {"サトウ"}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end