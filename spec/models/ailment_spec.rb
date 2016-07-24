require 'rails_helper'

describe Ailment, type: :model do
  subject { create :ailment }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
