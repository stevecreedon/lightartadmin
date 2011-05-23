require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe QuickCostsController do
  
  before(:each) do
    sign_in :user, Factory(:user)
  end

  # This should return the minimal set of attributes required to create a valid
  # QuickCost. As you add validations to QuickCost, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => 'test quick cost'}
  end

  describe "GET index" do
    it "assigns all quick_costs as @quick_costs" do
      quick_cost = QuickCost.create! valid_attributes
      get :index
      assigns(:quick_costs).should eq([quick_cost])
    end
  end

  describe "GET show" do
    it "assigns the requested quick_cost as @quick_cost" do
      quick_cost = QuickCost.create! valid_attributes
      get :show, :id => quick_cost.id.to_s
      assigns(:quick_cost).should eq(quick_cost)
    end
  end

  describe "GET new" do
    it "assigns a new quick_cost as @quick_cost" do
      get :new
      assigns(:quick_cost).should be_a_new(QuickCost)
    end
  end

  describe "GET edit" do
    it "assigns the requested quick_cost as @quick_cost" do
      quick_cost = QuickCost.create! valid_attributes
      get :edit, :id => quick_cost.id.to_s
      assigns(:quick_cost).should eq(quick_cost)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new QuickCost" do
        expect {
          post :create, :quick_cost => valid_attributes
        }.to change(QuickCost, :count).by(1)
      end

      it "assigns a newly created quick_cost as @quick_cost" do
        post :create, :quick_cost => valid_attributes
        assigns(:quick_cost).should be_a(QuickCost)
        assigns(:quick_cost).should be_persisted
      end

      it "redirects to the created quick_cost" do
        post :create, :quick_cost => valid_attributes
        response.should redirect_to(QuickCost.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved quick_cost as @quick_cost" do
        # Trigger the behavior that occurs when invalid params are submitted
        QuickCost.any_instance.stubs(:save).returns(false)
        post :create, :quick_cost => {}
        assigns(:quick_cost).should be_a_new(QuickCost)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        QuickCost.any_instance.stubs(:save).returns(false)
        post :create, :quick_cost => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested quick_cost" do
        quick_cost = QuickCost.create! valid_attributes
        # Assuming there are no other quick_costs in the database, this
        # specifies that the QuickCost created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        QuickCost.any_instance.expects(:update_attributes).with({'these' => 'params'})
        put :update, :id => quick_cost.id, :quick_cost => {'these' => 'params'}
      end

      it "assigns the requested quick_cost as @quick_cost" do
        quick_cost = QuickCost.create! valid_attributes
        put :update, :id => quick_cost.id, :quick_cost => valid_attributes
        assigns(:quick_cost).should eq(quick_cost)
      end

      it "redirects to the quick_cost" do
        quick_cost = QuickCost.create! valid_attributes
        put :update, :id => quick_cost.id, :quick_cost => valid_attributes
        response.should redirect_to(quick_cost)
      end
    end

    describe "with invalid params" do
      it "assigns the quick_cost as @quick_cost" do
        quick_cost = QuickCost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        QuickCost.any_instance.stubs(:save).returns(false)
        put :update, :id => quick_cost.id.to_s, :quick_cost => {}
        assigns(:quick_cost).should eq(quick_cost)
      end

      it "re-renders the 'edit' template" do
        quick_cost = QuickCost.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        QuickCost.any_instance.stubs(:save).returns(false)
        put :update, :id => quick_cost.id.to_s, :quick_cost => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested quick_cost" do
      quick_cost = QuickCost.create! valid_attributes
      expect {
        delete :destroy, :id => quick_cost.id.to_s
      }.to change(QuickCost, :count).by(-1)
    end

    it "redirects to the quick_costs list" do
      quick_cost = QuickCost.create! valid_attributes
      delete :destroy, :id => quick_cost.id.to_s
      response.should redirect_to(quick_costs_url)
    end
  end

end
