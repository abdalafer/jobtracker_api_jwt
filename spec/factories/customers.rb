# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    full_name "MyString"
    address "MyString"
    notes "MyText"
  end
end
