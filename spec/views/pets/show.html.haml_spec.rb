require 'spec_helper'

describe "pets/show.html.haml" do
  before(:each) do
    @pet = assign(:pet, stub_model(Pet,
      :name => "Name",
      :kind => "Kind"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Kind/)
  end
end
