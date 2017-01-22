# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    full_name "MyString"
    email "MyString"
    authentication_token "MyString"
    password_digest "MyString"
  end
end
