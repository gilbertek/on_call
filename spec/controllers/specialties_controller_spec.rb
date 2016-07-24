require 'rails_helper'

describe SpecialtiesController, type: :controller do
  let(:valid_attributes) { attributes_for :specialty }

  let(:invalid_attributes) { attributes_for :specialty, name: '' }


  describe "GET #index" do
    it "assigns all specialties as @specialties" do
      specialty = Specialty.create! valid_attributes
      get :index, {}
      expect(assigns(:specialties)).to eq([specialty])
    end
  end

  describe "GET #show" do
    it "assigns the requested specialty as @specialty" do
      specialty = Specialty.create! valid_attributes
      get :show, {:id => specialty.to_param}
      expect(assigns(:specialty)).to eq(specialty)
    end
  end

  describe "GET #new" do
    it "assigns a new specialty as @specialty" do
      get :new, {}
      expect(assigns(:specialty)).to be_a_new(Specialty)
    end
  end

  describe "GET #edit" do
    it "assigns the requested specialty as @specialty" do
      specialty = Specialty.create! valid_attributes
      get :edit, {:id => specialty.to_param}
      expect(assigns(:specialty)).to eq(specialty)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Specialty" do
        expect {
          post :create, {:specialty => valid_attributes}
        }.to change(Specialty, :count).by(1)
      end

      it "assigns a newly created specialty as @specialty" do
        post :create, {:specialty => valid_attributes}
        expect(assigns(:specialty)).to be_a(Specialty)
        expect(assigns(:specialty)).to be_persisted
      end

      it "redirects to the created specialty" do
        post :create, {:specialty => valid_attributes}
        expect(response).to redirect_to(Specialty.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved specialty as @specialty" do
        post :create, {:specialty => invalid_attributes}
        expect(assigns(:specialty)).to be_a_new(Specialty)
      end

      it "re-renders the 'new' template" do
        post :create, {:specialty => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for :specialty,name: 'Orthopedists' }

      it "updates the requested specialty" do
        specialty = Specialty.create! valid_attributes
        put :update, {:id => specialty.to_param, :specialty => new_attributes}
        specialty.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested specialty as @specialty" do
        specialty = Specialty.create! valid_attributes
        put :update, {:id => specialty.to_param, :specialty => valid_attributes}
        expect(assigns(:specialty)).to eq(specialty)
      end

      it "redirects to the specialty" do
        specialty = Specialty.create! valid_attributes
        put :update, {:id => specialty.to_param, :specialty => valid_attributes}
        expect(response).to redirect_to(specialty)
      end
    end

    context "with invalid params" do
      it "assigns the specialty as @specialty" do
        specialty = Specialty.create! valid_attributes
        put :update, {:id => specialty.to_param, :specialty => invalid_attributes}
        expect(assigns(:specialty)).to eq(specialty)
      end

      it "re-renders the 'edit' template" do
        specialty = Specialty.create! valid_attributes
        put :update, {:id => specialty.to_param, :specialty => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested specialty" do
      specialty = Specialty.create! valid_attributes
      expect {
        delete :destroy, {:id => specialty.to_param}
      }.to change(Specialty, :count).by(-1)
    end

    it "redirects to the specialties list" do
      specialty = Specialty.create! valid_attributes
      delete :destroy, {:id => specialty.to_param}
      expect(response).to redirect_to(specialties_url)
    end
  end
end
