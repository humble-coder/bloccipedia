# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wiki do
    title "My Public Wiki"
    body "Some content"

    trait :as_private do
      title "My Private Wiki"
      public false
    end

    trait :with_collaborator do
      users { |wiki_user| [wiki_user.association(:user)] }
    end

    trait :with_premium_user do
      users { |wiki_user| [wiki_user.association(:user, :as_premium_user)] }
    end
  end
end
