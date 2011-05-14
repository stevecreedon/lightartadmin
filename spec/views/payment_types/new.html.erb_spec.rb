require 'spec_helper'

describe "payment_types/new.html.erb" do
  before(:each) do
    assign(:payment_type, stub_model(PaymentType,
      :name => "",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new payment_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payment_types_path, :method => "post" do
      assert_select "input#payment_type_name", :name => "payment_type[name]"
      assert_select "input#payment_type_user_id", :name => "payment_type[user_id]"
    end
  end
end
