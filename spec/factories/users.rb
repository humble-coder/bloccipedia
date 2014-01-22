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

    trait :as_second_collaborator do
      name "carlb"
      email "carl@example.com"
    end

    trait :with_public_wiki do
      wikis {
        1.times.map do
          FactoryGirl.create(:wiki)
        end
      }
    end

    trait :with_private_wiki do
      wikis {
        1.times.map do
          FactoryGirl.create(:wiki, :as_private)
        end
      }
    end
  end
end
