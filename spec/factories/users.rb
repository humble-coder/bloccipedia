# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "markb"
    email "valid@example.com"
    password "password"
    confirmed_at Time.now
    premium false

    trait :as_premium_user do
      name "johnb"
      premium true
      email "premium_user@example.com"
    end

    trait :as_second_collaborator do
      name "carlb"
      email "carl@example.com"
      premium false
    end
  end
end
