require 'spec_helper'

describe "pets/index.html.haml" do
  before(:each) do
    assign(:pets, [
      stub_model(Pet,
        :name => "Name",
        :kind => "Kind"
      ),
      stub_model(Pet,
        :name => "Name",
        :kind => "Kind"
      )
    ])
  end

  it "renders a list of pets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Kind".to_s, :count => 2
  end
end
