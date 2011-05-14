require "spec_helper"

describe CostCentresController do
  describe "routing" do

    it "routes to #index" do
      get("/cost_centres").should route_to("cost_centres#index")
    end

    it "routes to #new" do
      get("/cost_centres/new").should route_to("cost_centres#new")
    end

    it "routes to #show" do
      get("/cost_centres/1").should route_to("cost_centres#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cost_centres/1/edit").should route_to("cost_centres#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cost_centres").should route_to("cost_centres#create")
    end

    it "routes to #update" do
      put("/cost_centres/1").should route_to("cost_centres#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cost_centres/1").should route_to("cost_centres#destroy", :id => "1")
    end

  end
end
