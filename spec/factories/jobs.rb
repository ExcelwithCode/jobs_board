FactoryGirl.define do
  factory :job do
    title "Data Scientist"
    category "Education"
    company_name { Faker::Company.name }
    website { Faker::Internet.url }
    email   { Faker::Internet.email }
    location { Faker::Address.city }
    description { Faker::Lorem.sentence(200) }
    to_apply { Faker::Lorem.sentence(1) }
  end
end