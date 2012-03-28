require 'spec_helper'

describe "petsitters/new.html.haml" do
  before(:each) do
    assign(:petsitter, stub_model(Petsitter,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new petsitter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => petsitters_path, :method => "post" do
      assert_select "input#petsitter_name", :name => "petsitter[name]"
    end
  end
end
