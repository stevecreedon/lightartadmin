require 'spec_helper'

describe "cost_types/index.html.erb" do
  before(:each) do
    assign(:cost_types, [
      Factory(:cost_type,
        :name => "Name"
      ),
      Factory(:cost_type,
        :name => "Name"
      )
    ])
  end

  it "renders a list of cost_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
