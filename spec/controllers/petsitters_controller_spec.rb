require 'spec_helper'

describe PetsittersController do

  def mock_petsitter(stubs={})
    (@mock_petsitter ||= mock_model(Petsitter).as_null_object).tap do |petsitter|
      petsitter.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all petsitters as @petsitters" do
      Petsitter.stub(:all) { [mock_petsitter] }
      get :index
      assigns(:petsitters).should eq([mock_petsitter])
    end
  end

  describe "GET show" do
    it "assigns the requested petsitter as @petsitter" do
      Petsitter.stub(:find).with("37") { mock_petsitter }
      get :show, :id => "37"
      assigns(:petsitter).should be(mock_petsitter)
    end
  end

  describe "GET new" do
    it "assigns a new petsitter as @petsitter" do
      Petsitter.stub(:new) { mock_petsitter }
      get :new
      assigns(:petsitter).should be(mock_petsitter)
    end
  end

  describe "GET edit" do
    it "assigns the requested petsitter as @petsitter" do
      Petsitter.stub(:find).with("37") { mock_petsitter }
      get :edit, :id => "37"
      assigns(:petsitter).should be(mock_petsitter)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created petsitter as @petsitter" do
        Petsitter.stub(:new).with({'these' => 'params'}) { mock_petsitter(:save => true) }
        post :create, :petsitter => {'these' => 'params'}
        assigns(:petsitter).should be(mock_petsitter)
      end

      it "redirects to the created petsitter" do
        Petsitter.stub(:new) { mock_petsitter(:save => true) }
        post :create, :petsitter => {}
        response.should redirect_to(petsitter_url(mock_petsitter))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved petsitter as @petsitter" do
        Petsitter.stub(:new).with({'these' => 'params'}) { mock_petsitter(:save => false) }
        post :create, :petsitter => {'these' => 'params'}
        assigns(:petsitter).should be(mock_petsitter)
      end

      it "re-renders the 'new' template" do
        Petsitter.stub(:new) { mock_petsitter(:save => false) }
        post :create, :petsitter => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested petsitter" do
        Petsitter.should_receive(:find).with("37") { mock_petsitter }
        mock_petsitter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :petsitter => {'these' => 'params'}
      end

      it "assigns the requested petsitter as @petsitter" do
        Petsitter.stub(:find) { mock_petsitter(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:petsitter).should be(mock_petsitter)
      end

      it "redirects to the petsitter" do
        Petsitter.stub(:find) { mock_petsitter(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(petsitter_url(mock_petsitter))
      end
    end

    describe "with invalid params" do
      it "assigns the petsitter as @petsitter" do
        Petsitter.stub(:find) { mock_petsitter(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:petsitter).should be(mock_petsitter)
      end

      it "re-renders the 'edit' template" do
        Petsitter.stub(:find) { mock_petsitter(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested petsitter" do
      Petsitter.should_receive(:find).with("37") { mock_petsitter }
      mock_petsitter.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the petsitters list" do
      Petsitter.stub(:find) { mock_petsitter }
      delete :destroy, :id => "1"
      response.should redirect_to(petsitters_url)
    end
  end

end
