# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    message { Faker::Lorem.paragraphs(number: 1) }
  end
end
