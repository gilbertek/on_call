require 'rails_helper'

describe Patient do
  subject { create :patient }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to have_and_belong_to_many(:ailments) }
    it { is_expected.to accept_nested_attributes_for(:ailments) }
  end


  it_behaves_like 'a person'
end
