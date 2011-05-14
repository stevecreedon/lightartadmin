require 'spec_helper'

describe "cost_centres/index.html.erb" do
  before(:each) do
    assign(:cost_centres, [
      stub_model(CostCentre,
        :name => "Name"
      ),
      stub_model(CostCentre,
        :name => "Name"
      )
    ])
  end

  it "renders a list of cost_centres" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
