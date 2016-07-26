FactoryGirl.define do
  factory :appointment do
    doctor
    patient
    start_at Time.now + 4.days
  end
end
