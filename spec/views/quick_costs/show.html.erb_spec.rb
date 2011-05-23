require 'spec_helper'

describe "quick_costs/show.html.erb" do
  before(:each) do
    @quick_cost = assign(:quick_cost, stub_model(QuickCost))
  end

  it "renders attributes in <p>" do
    render
  end
end
