FactoryGirl.define do
  factory :appointment do
    doctor
    patient
    start_at Time.now + 3.days
  end
end
