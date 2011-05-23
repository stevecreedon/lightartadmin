require 'spec_helper'

describe "quick_costs/new.html.erb" do
  before(:each) do
    assign(:quick_cost, stub_model(QuickCost).as_new_record)
  end

  it "renders new quick_cost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quick_costs_path, :method => "post" do
    end
  end
end
