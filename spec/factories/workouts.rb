# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :workout, class: Workout do
    activity "activity"
    date "12/10/2014"
    duration "60"
    intensity "high"
  end

end
