require 'spec_helper'

describe "projects/new.html.erb" do
  before(:each) do
    assign(:project, Factory(:project))
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
    end
  end
end
