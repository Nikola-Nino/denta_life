# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    first_name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
    date_of_birth { Faker::Date.birthday }
    last_name { Faker::Name.last_name }
  end
end
