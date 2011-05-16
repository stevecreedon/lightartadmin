require 'spec_helper'

describe "payment_methods/new.html.erb" do
  before(:each) do
    assign(:payment_method, Factory(:payment_method,
      :name => "pm1",
      :user_id => 1
    ))
  end

  it "renders new payment_method form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payment_methods_path, :method => "post" do
      assert_select "input#payment_method_name", :name => "payment_method[name]"
      assert_select "input#payment_method_user_id", :name => "payment_method[user_id]"
    end
  end
end
