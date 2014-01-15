# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "markb"
    email "valid@example.com"
    password "password"
    confirmed_at Time.now

    trait :as_premium_user do
      name "johnb"
      premium true
      email "premium_user@example.com"
      password "password"
      confirmed_at Time.now
    end
  end
end
