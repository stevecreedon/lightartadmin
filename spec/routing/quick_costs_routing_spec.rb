require "spec_helper"

describe QuickCostsController do
  describe "routing" do

    it "routes to #index" do
      get("/quick_costs").should route_to("quick_costs#index")
    end

    it "routes to #new" do
      get("/quick_costs/new").should route_to("quick_costs#new")
    end

    it "routes to #show" do
      get("/quick_costs/1").should route_to("quick_costs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/quick_costs/1/edit").should route_to("quick_costs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/quick_costs").should route_to("quick_costs#create")
    end

    it "routes to #update" do
      put("/quick_costs/1").should route_to("quick_costs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/quick_costs/1").should route_to("quick_costs#destroy", :id => "1")
    end

  end
end
