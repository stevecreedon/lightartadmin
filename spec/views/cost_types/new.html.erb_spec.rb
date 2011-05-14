require 'spec_helper'

describe "cost_types/new.html.erb" do
  before(:each) do
    assign(:cost_type, stub_model(CostType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new cost_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cost_types_path, :method => "post" do
      assert_select "input#cost_type_name", :name => "cost_type[name]"
    end
  end
end
