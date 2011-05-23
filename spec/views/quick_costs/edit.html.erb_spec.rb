require 'spec_helper'

describe "quick_costs/edit.html.erb" do
  before(:each) do
    @quick_cost = assign(:quick_cost, stub_model(QuickCost))
  end

  it "renders the edit quick_cost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quick_costs_path(@quick_cost), :method => "post" do
    end
  end
end
