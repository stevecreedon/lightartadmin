require 'spec_helper'

describe "costs/new.html.erb" do
  before(:each) do
    assign(:cost, Factory(:cost,
      :amount => "",
      :vat => "",
      :description => "",
      :reference => "",
      :payment_date => "",
      :cost_centre_id => "",
      :user_id => "",
      :payment_method_id => "",
      :cost_type_id => "",
      :company_id => "",
      :contact_id => 1
    ).as_new_record)
  end

  it "renders new cost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => costs_path, :method => "post" do
      assert_select "input#cost_amount", :name => "cost[amount]"
      assert_select "input#cost_vat", :name => "cost[vat]"
      assert_select "input#cost_description", :name => "cost[description]"
      assert_select "input#cost_reference", :name => "cost[reference]"
      assert_select "input#cost_payment_date", :name => "cost[payment_date]"
      assert_select "input#cost_cost_centre_id", :name => "cost[cost_centre_id]"
      assert_select "input#cost_user_id", :name => "cost[user_id]"
      assert_select "input#cost_payment_method_id", :name => "cost[payment_method_id]"
      assert_select "input#cost_cost_type_id", :name => "cost[cost_type_id]"
      assert_select "input#cost_company_id", :name => "cost[company_id]"
      assert_select "input#cost_contact_id", :name => "cost[contact_id]"
    end
  end
end
