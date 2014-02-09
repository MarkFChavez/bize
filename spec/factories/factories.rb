PASS = Faker::Internet.password(8)

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password PASS
    password_confirmation PASS
  end

  factory :project do
    name Faker::Name.name
  end
end
