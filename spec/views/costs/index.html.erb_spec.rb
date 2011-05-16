require 'spec_helper'

describe "costs/index.html.erb" do
  before(:each) do
    assign(:costs, [
      Factory(:cost,
        :amount => "",
        :vat => "",
        :description => "",
        :reference => "",
        :payment_date => "",
        :cost_centre_id => "",
        :payer_id => "",
        :payment_method_id => "",
        :cost_type_id => "",
        :company_id => "",
        :contact_id => 1
      ),
      Factory(:cost,
        :amount => "",
        :vat => "",
        :description => "",
        :reference => "",
        :payment_date => "",
        :cost_centre_id => "",
        :payer_id => "",
        :payment_method_id => "",
        :cost_type_id => "",
        :company_id => "",
        :contact_id => 1
      )
    ])
  end

  it "renders a list of costs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
