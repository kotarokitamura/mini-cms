require 'spec_helper'

describe "organizations/edit" do
  before(:each) do
    @organization = assign(:organization, stub_model(Organization,
      :organization_name => "MyString",
      :organization_code => "MyString"
    ))
  end

  it "renders the edit organization form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organization_path(@organization), "post" do
      assert_select "input#organization_organization_name[name=?]", "organization[organization_name]"
      assert_select "input#organization_organization_code[name=?]", "organization[organization_code]"
    end
  end
end
