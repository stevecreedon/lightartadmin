require "spec_helper"

describe CostsController do
  describe "routing" do

    it "routes to #index" do
      get("/costs").should route_to("costs#index")
    end

    it "routes to #new" do
      get("/costs/new").should route_to("costs#new")
    end

    it "routes to #show" do
      get("/costs/1").should route_to("costs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/costs/1/edit").should route_to("costs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/costs").should route_to("costs#create")
    end

    it "routes to #update" do
      put("/costs/1").should route_to("costs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/costs/1").should route_to("costs#destroy", :id => "1")
    end

  end
end
