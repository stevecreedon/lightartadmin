require 'spec_helper'

describe "cost_types/edit.html.erb" do
  before(:each) do
    @cost_type = assign(:cost_type, stub_model(CostType,
      :name => "MyString"
    ))
  end

  it "renders the edit cost_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cost_types_path(@cost_type), :method => "post" do
      assert_select "input#cost_type_name", :name => "cost_type[name]"
    end
  end
end
