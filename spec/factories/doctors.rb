FactoryGirl.define do
  factory :doctor do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    street { Faker::Address.street_address }
    city 'New York'
    state 'NY'
    zip '10012'
    specialty_id 1
  end
end
