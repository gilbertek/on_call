require 'rails_helper'

RSpec.describe "Ailments", type: :request do
  describe "GET /ailments" do
    it "works! (now write some real specs)" do
      get ailments_index_path
      expect(response).to have_http_status(200)
    end
  end
end
