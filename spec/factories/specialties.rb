FactoryGirl.define do
  factory :specialty do
    name "Orthopedists"
    description "broken bones"

    trait :opthamologist do
      name "Ophthalmologist"
      description "eye trouble "
    end

    trait :cardiologist do
      name "Cardiologist"
      description "heart disease"
    end
  end
end
