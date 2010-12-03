require 'spec_helper'

describe "petsitters/edit.html.haml" do
  before(:each) do
    @petsitter = assign(:petsitter, stub_model(Petsitter,
      :name => "MyString"
    ))
  end

  it "renders the edit petsitter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => petsitter_path(@petsitter), :method => "post" do
      assert_select "input#petsitter_name", :name => "petsitter[name]"
    end
  end
end
