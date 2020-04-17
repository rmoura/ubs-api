# frozen_string_literal: true

FactoryBot.define do
  factory :establishment do
    cnes_id { Faker::Number.number(digits: 3) }
    name { Faker::Company.name }
    address { Faker::Address.street_name }
    number { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    uf { Faker::Address.state }
    phone { Faker::PhoneNumber.cell_phone }
    latitude  { (Math::PI * rand).round(13) }
    longitude { (Math::PI * rand).round(13) }
  end
end
