# frozen_string_literal: true

FactoryBot.define do
  factory :campaign, class: Campaign do
    name { Faker::Company.catch_phrase }
    image_url { Faker::Internet.url(path: '.jpg') }
    country { Faker::Address.country }
    sector { Faker::Company.industry }
    percentage_raised { rand(100) }
    target_amount { rand(1000..100_000) }
    investment_multiple { rand(100.0..1000.0) }
  end
end
