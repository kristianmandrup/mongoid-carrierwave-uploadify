require "spec_helper"

describe PetsittersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/petsitters" }.should route_to(:controller => "petsitters", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/petsitters/new" }.should route_to(:controller => "petsitters", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/petsitters/1" }.should route_to(:controller => "petsitters", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/petsitters/1/edit" }.should route_to(:controller => "petsitters", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/petsitters" }.should route_to(:controller => "petsitters", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/petsitters/1" }.should route_to(:controller => "petsitters", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/petsitters/1" }.should route_to(:controller => "petsitters", :action => "destroy", :id => "1")
    end

  end
end
