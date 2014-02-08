PASS = Faker::Internet.password

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password PASS
    password_confirmation PASS
  end
end
