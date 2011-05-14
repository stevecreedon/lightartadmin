require 'spec_helper'

describe "cost_centres/edit.html.erb" do
  before(:each) do
    @cost_centre = assign(:cost_centre, stub_model(CostCentre,
      :name => "MyString"
    ))
  end

  it "renders the edit cost_centre form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cost_centres_path(@cost_centre), :method => "post" do
      assert_select "input#cost_centre_name", :name => "cost_centre[name]"
    end
  end
end
