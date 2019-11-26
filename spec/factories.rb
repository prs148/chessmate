# This will guess the User class
# Adjusted by JB to allow multiple users to be logged in to tests at a time. #{n} increases numarically for multiple email addresses.
FactoryBot.define do
  factory :user do
    sequence :email do |n|
       "dummyEmail#{n}@gmail.com" 
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end
end
# This will guess the User class
FactoryBot.define do
  factory :game do
    user { build(:user) }
  end
end
