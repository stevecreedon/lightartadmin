require 'spec_helper'

describe "quick_costs/index.html.erb" do
  before(:each) do
    assign(:quick_costs, [
      stub_model(QuickCost),
      stub_model(QuickCost)
    ])
  end

  it "renders a list of quick_costs" do
    render
  end
end
