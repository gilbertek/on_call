require 'rails_helper'

describe Appointment, type: :model do
  subject { create :appointment, start_at: (Time.current + 4.days) }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:start_at) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:doctor) }
    it { is_expected.to belong_to(:patient) }
  end
end
