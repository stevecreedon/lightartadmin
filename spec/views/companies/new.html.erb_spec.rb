require 'spec_helper'

describe "companies/new.html.erb" do
  before(:each) do
    assign(:company, Factory(:company,
      :name => "MyString"
    ))
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path, :method => "post" do
      assert_select "input#company_name", :name => "company[name]"
    end
  end
end
