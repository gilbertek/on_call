require 'rails_helper'

describe AilmentsController, type: :controller do
  let(:valid_attributes) { attributes_for :ailment }

  let(:invalid_attributes) { attributes_for :ailment, name: '' }


  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all ailments as @ailments" do
      ailment = Ailment.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:ailments)).to eq([ailment])
    end
  end

  describe "GET #show" do
    it "assigns the requested ailment as @ailment" do
      ailment = Ailment.create! valid_attributes
      get :show, {:id => ailment.to_param}, valid_session
      expect(assigns(:ailment)).to eq(ailment)
    end
  end

  describe "GET #new" do
    it "assigns a new ailment as @ailment" do
      get :new, {}, valid_session
      expect(assigns(:ailment)).to be_a_new(Ailment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested ailment as @ailment" do
      ailment = Ailment.create! valid_attributes
      get :edit, {:id => ailment.to_param}, valid_session
      expect(assigns(:ailment)).to eq(ailment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Ailment" do
        expect {
          post :create, {:ailment => valid_attributes}, valid_session
        }.to change(Ailment, :count).by(1)
      end

      it "assigns a newly created ailment as @ailment" do
        post :create, {:ailment => valid_attributes}, valid_session
        expect(assigns(:ailment)).to be_a(Ailment)
        expect(assigns(:ailment)).to be_persisted
      end

      it "redirects to the created ailment" do
        post :create, {:ailment => valid_attributes}, valid_session
        expect(response).to redirect_to(Ailment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved ailment as @ailment" do
        post :create, {:ailment => invalid_attributes}, valid_session
        expect(assigns(:ailment)).to be_a_new(Ailment)
      end

      it "re-renders the 'new' template" do
        post :create, {:ailment => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for :ailment, name: 'heart disease'
      }


      it "updates the requested ailment" do
        ailment = Ailment.create! valid_attributes
        put :update, {:id => ailment.to_param, :ailment => new_attributes}, valid_session
        ailment.reload
        expect(ailment.name).to eq(new_attributes[:name])
      end

      it "assigns the requested ailment as @ailment" do
        ailment = Ailment.create! valid_attributes
        put :update, {:id => ailment.to_param, :ailment => valid_attributes}, valid_session
        expect(assigns(:ailment)).to eq(ailment)
      end

      it "redirects to the ailment" do
        ailment = Ailment.create! valid_attributes
        put :update, {:id => ailment.to_param, :ailment => valid_attributes}, valid_session
        expect(response).to redirect_to(ailment)
      end
    end

    context "with invalid params" do
      it "assigns the ailment as @ailment" do
        ailment = Ailment.create! valid_attributes
        put :update, {:id => ailment.to_param, :ailment => invalid_attributes}, valid_session
        expect(assigns(:ailment)).to eq(ailment)
      end

      it "re-renders the 'edit' template" do
        ailment = Ailment.create! valid_attributes
        put :update, {:id => ailment.to_param, :ailment => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested ailment" do
      ailment = Ailment.create! valid_attributes
      expect {
        delete :destroy, {:id => ailment.to_param}, valid_session
      }.to change(Ailment, :count).by(-1)
    end

    it "redirects to the ailments list" do
      ailment = Ailment.create! valid_attributes
      delete :destroy, {:id => ailment.to_param}, valid_session
      expect(response).to redirect_to(ailments_url)
    end
  end
end
