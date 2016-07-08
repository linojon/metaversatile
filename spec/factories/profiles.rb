FactoryGirl.define do
  factory :profile do
    sequence(:email)  { |n| "email-#{n}@example.com" }
  end
end
