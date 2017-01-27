# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    title "MyString"
    state 1
    customer nil
    notes "MyText"
  end
end
