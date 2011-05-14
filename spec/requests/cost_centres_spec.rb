require 'spec_helper'

describe "CostCentres" do
  describe "GET /cost_centres" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cost_centres_path
      response.status.should be(200)
    end
  end
end
