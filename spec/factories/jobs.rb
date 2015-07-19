FactoryGirl.define do
  factory :job do
    title "Data Scientist"
    category "Education"
    location { Faker::Address.city }
    description { Faker::Lorem.sentence(200) }
    to_apply { Faker::Lorem.sentence(1) }
  end
end