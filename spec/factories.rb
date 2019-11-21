# This will guess the User class
FactoryBot.define do
  factory :user do
    email { "a@b.c" }
    password  { "6chara" }
  end
end

# This will guess the User class
FactoryBot.define do
  factory :game do
    user { build(:user) }
  end
end