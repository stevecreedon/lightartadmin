require 'spec_helper'

describe "payment_types/show.html.erb" do
  before(:each) do
    @payment_type = assign(:payment_type, stub_model(PaymentType,
      :name => "",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
