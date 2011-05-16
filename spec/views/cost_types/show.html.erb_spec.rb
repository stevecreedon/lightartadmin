require 'spec_helper'

describe "cost_types/show.html.erb" do
  before(:each) do
    @cost_type = assign(:cost_type, Factory(:cost_type,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
