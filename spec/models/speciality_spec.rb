require 'rails_helper'

describe Speciality, type: :model do
  subject { create :speciality }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
  end
end
