FactoryBot.define do
  factory :investment, class: Investment do
    association :campaign
    amount { rand(1..100) }
  end
end
