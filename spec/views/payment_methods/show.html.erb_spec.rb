require 'spec_helper'

describe "payment_methods/show.html.erb" do
  before(:each) do
    @payment_method = assign(:payment_method, Factory(:payment_method,
      :name => "pm1",
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
