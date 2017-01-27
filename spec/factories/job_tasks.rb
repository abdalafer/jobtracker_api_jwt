# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_task do
    title "MyString"
    state 1
    job nil
    notes "MyText"
  end
end
