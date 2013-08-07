require 'spec_helper'

describe "organizations/index" do
  before(:each) do
    assign(:organizations, [
      stub_model(Organization,
        :organization_name => "Organization Name",
        :organization_code => "Organization Code"
      ),
      stub_model(Organization,
        :organization_name => "Organization Name",
        :organization_code => "Organization Code"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Organization Name".to_s, :count => 2
    assert_select "tr>td", :text => "Organization Code".to_s, :count => 2
  end
end
