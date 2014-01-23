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
    end

    trait :with_public_wiki do
      wikis { |user_wiki| [user_wiki.association(:wiki)] } 
    end

    trait :with_private_wiki do
      wikis { |user_wiki| [user_wiki.association(:wiki, :as_private)] }
    end

    trait :with_private_wiki_with_collaborator do
      wikis { |user_wiki| [user_wiki.association(:wiki, :as_private, :with_collaborator)] }
    end

  end
end
