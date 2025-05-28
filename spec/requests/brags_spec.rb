require 'rails_helper'

RSpec.describe "Brags", type: :request do
  describe "GET /brags" do
    it "returns http success" do
      get "/brags"
      expect(response).to have_http_status(:success)
    end
  end
end
