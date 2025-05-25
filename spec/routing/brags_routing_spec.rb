require "rails_helper"

RSpec.describe BragsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/brags").to route_to("brags#index")
    end

    it "routes to #index via named route" do
      expect(get: "/brag").to route_to("brags#index")
    end
  end
end