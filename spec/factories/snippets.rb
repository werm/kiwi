# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :snippet do
    name "MyString"
    html "MyText"
    css "MyText"
  end
end
