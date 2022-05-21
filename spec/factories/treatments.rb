# frozen_string_literal: true

FactoryBot.define do
  factory :treatment do
    full_name { Faker::Name.name }
    date_of_visit { Faker::Date.birthday }
    diagnosis { Faker::Lorem.paragraphs(number: 1).join('.') }
    treatment { Faker::Lorem.paragraphs(number: 1).join('.') }
    special_conditions_and_additional_notes { Faker::Lorem.paragraphs(number: 1).join('.') }
  end
end
