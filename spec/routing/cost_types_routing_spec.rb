require "spec_helper"

describe CostTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/cost_types").should route_to("cost_types#index")
    end

    it "routes to #new" do
      get("/cost_types/new").should route_to("cost_types#new")
    end

    it "routes to #show" do
      get("/cost_types/1").should route_to("cost_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cost_types/1/edit").should route_to("cost_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cost_types").should route_to("cost_types#create")
    end

    it "routes to #update" do
      put("/cost_types/1").should route_to("cost_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cost_types/1").should route_to("cost_types#destroy", :id => "1")
    end

  end
end
