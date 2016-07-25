require 'rails_helper'

describe Specialty, type: :model do
  subject { create :specialty }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
