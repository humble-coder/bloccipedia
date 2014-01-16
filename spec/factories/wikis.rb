# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wiki do
    title "My Public Wiki"
    body "Some content"

    trait :as_private do
      title "My Private Wiki"
      public false
    end
  end
end
