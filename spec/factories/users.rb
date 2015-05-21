# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    name "Bob Jones"
    email "bob.jones@example.com"
    password "notasecret"
    password_confirmation "notasecret" 
    confirmed_at  2.months.ago

    trait :admin do
      name "Administration"
      email "admin@example.com"
      admin true
    end

    trait :expired do
      created_at { 3.months.ago }
    end

    trait :unconfirmed do
      confirmed_at nil
    end
  end
end