# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :target do
    due_date Time.now + 60*60*24
  end
  
end
