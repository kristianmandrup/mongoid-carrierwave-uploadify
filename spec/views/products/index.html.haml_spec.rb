require 'spec_helper'

describe "products/index.html.haml" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name",
        :price => 1,
        :description => "MyText"
      ),
      stub_model(Product,
        :name => "Name",
        :price => 1,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of products" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
