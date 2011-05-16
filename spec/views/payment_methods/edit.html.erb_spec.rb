require 'spec_helper'

describe "payment_methods/edit.html.erb" do
  before(:each) do
    @payment_method = assign(:payment_method, Factory(:payment_method,
      :name => "pm1",
      :user_id => 1
    ))
  end

  it "renders the edit payment_method form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payment_methods_path(@payment_method), :method => "post" do
      assert_select "input#payment_method_name", :name => "payment_method[name]"
      assert_select "input#payment_method_user_id", :name => "payment_method[user_id]"
    end
  end
end
