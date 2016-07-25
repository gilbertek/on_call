require 'rails_helper'

describe Ailment, type: :model do
  subject { create :ailment }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to respond_to :name }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'association' do
    it { is_expected.to respond_to :patients }
    it { is_expected.to have_and_belong_to_many(:patients) }
  end
end
