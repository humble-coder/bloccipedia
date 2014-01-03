# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "markb"
    email "valid@example.com"
    password "password"
    confirmed_at Time.now
    role "Free"

    trait :as_premium_user do
      role "Premium"
    end
  end
end
