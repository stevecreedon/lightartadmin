require 'spec_helper'

describe "contacts/new.html.erb" do
  before(:each) do
    assign(:contact, Factory(:contact,
      :name => "MyString"
    ))
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path, :method => "post" do
      assert_select "input#contact_name", :name => "contact[name]"
    end
  end
end
