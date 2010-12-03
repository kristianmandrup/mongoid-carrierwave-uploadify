require 'spec_helper'

describe "pets/new.html.haml" do
  before(:each) do
    assign(:pet, stub_model(Pet,
      :name => "MyString",
      :kind => "MyString"
    ).as_new_record)
  end

  it "renders new pet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pets_path, :method => "post" do
      assert_select "input#pet_name", :name => "pet[name]"
      assert_select "input#pet_kind", :name => "pet[kind]"
    end
  end
end
