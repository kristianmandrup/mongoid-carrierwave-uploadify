require 'spec_helper'

describe "products/edit.html.haml" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :new_record? => false,
      :name => "MyString",
      :price => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit product form" do
    render

    rendered.should have_selector("form", :action => product_path(@product), :method => "post") do |form|
      form.should have_selector("input#product_name", :name => "product[name]")
      form.should have_selector("input#product_price", :name => "product[price]")
      form.should have_selector("textarea#product_description", :name => "product[description]")
    end
  end
end
