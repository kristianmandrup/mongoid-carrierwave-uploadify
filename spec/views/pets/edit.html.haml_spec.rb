require 'spec_helper'

describe "pets/edit.html.haml" do
  before(:each) do
    @pet = assign(:pet, stub_model(Pet,
      :name => "MyString",
      :kind => "MyString"
    ))
  end

  it "renders the edit pet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pet_path(@pet), :method => "post" do
      assert_select "input#pet_name", :name => "pet[name]"
      assert_select "input#pet_kind", :name => "pet[kind]"
    end
  end
end
