require 'spec_helper'

describe "payment_methods/index.html.erb" do
  before(:each) do
    assign(:payment_methods, [
      Factory(:payment_method,
        :name => "pm1",
        :user_id => 1
      ),
      Factory(:payment_method,
        :name => "pm1",
        :user_id => 1
      )
    ])
  end

  it "renders a list of payment_methods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "pm1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
