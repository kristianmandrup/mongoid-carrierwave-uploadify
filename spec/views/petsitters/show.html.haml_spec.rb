require 'spec_helper'

describe "petsitters/show.html.haml" do
  before(:each) do
    @petsitter = assign(:petsitter, stub_model(Petsitter,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
