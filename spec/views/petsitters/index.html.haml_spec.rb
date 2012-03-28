require 'spec_helper'

describe "petsitters/index.html.haml" do
  before(:each) do
    assign(:petsitters, [
      stub_model(Petsitter,
        :name => "Name"
      ),
      stub_model(Petsitter,
        :name => "Name"
      )
    ])
  end

  it "renders a list of petsitters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
