# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: 2) }
    content { Faker::Lorem.sentence(word_count: 7) }
  end
end
