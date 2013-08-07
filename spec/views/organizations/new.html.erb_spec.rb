require 'spec_helper'

describe "organizations/new" do
  before(:each) do
    assign(:organization, stub_model(Organization,
      :organization_name => "MyString",
      :organization_code => "MyString"
    ).as_new_record)
  end

  it "renders new organization form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organizations_path, "post" do
      assert_select "input#organization_organization_name[name=?]", "organization[organization_name]"
      assert_select "input#organization_organization_code[name=?]", "organization[organization_code]"
    end
  end
end
