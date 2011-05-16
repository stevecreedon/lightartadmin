require 'spec_helper'

describe "companies/index.html.erb" do
  before(:each) do
    assign(:companies, [
      Factory(:company,
        :name => "Name"
      ),
      Factory(:company,
        :name => "Name"
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
