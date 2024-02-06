require "factory_bot_rails"

FactoryBot.define do
  factory :room do
    sequence(:name) { |n| "name#{n}" }
    is_private { false }
  end

  trait :public do
    is_private { false }
  end

  trait :private do
    is_private { true }
  end
end
