# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

21.times do
    Campaign.create(
        name: Faker::Company.catch_phrase,
        image_url: Faker::Internet.url(path: '.jpg'),
        country: Faker::Address.country,
        sector: Faker::Company.industry,
        percentage_raised: rand(100),
        target_amount: rand(1000..100000),
        investment_multiple: rand(100.0..1000.0)
    )
end
