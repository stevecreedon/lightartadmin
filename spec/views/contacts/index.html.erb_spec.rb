require 'spec_helper'

describe "contacts/index.html.erb" do
  before(:each) do
    assign(:contacts, [
      Factory(:contact,
        :name => "Name"
      ),
      Factory(:contact,
        :name => "Name"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
