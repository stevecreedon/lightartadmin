require 'spec_helper'

describe "cost_centres/show.html.erb" do
  before(:each) do
    @cost_centre = assign(:cost_centre, Factory(:cost_centre,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
