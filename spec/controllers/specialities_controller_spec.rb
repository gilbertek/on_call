require 'rails_helper'

describe SpecialitiesController, type: :controller do
  let(:valid_attributes) { attributes_for :speciality }

  let(:invalid_attributes) { attributes_for :speciality, name: '' }


  describe "GET #index" do
    it "assigns all specialties as @specialties" do
      speciality = Speciality.create! valid_attributes
      get :index, {}
      expect(assigns(:specialities)).to eq([speciality])
    end
  end

  describe "GET #show" do
    it "assigns the requested specialty as @specialty" do
      speciality = Speciality.create! valid_attributes
      get :show, {:id => speciality.to_param}
      expect(assigns(:speciality)).to eq(speciality)
    end
  end

  describe "GET #new" do
    it "assigns a new specialty as @specialty" do
      get :new, {}
      expect(assigns(:speciality)).to be_a_new(Speciality)
    end
  end

  describe "GET #edit" do
    it "assigns the requested specialty as @specialty" do
      speciality = Speciality.create! valid_attributes
      get :edit, {:id => speciality.to_param}
      expect(assigns(:speciality)).to eq(speciality)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Specialty" do
        expect {
          post :create, {:speciality => valid_attributes}
        }.to change(Speciality, :count).by(1)
      end

      it "assigns a newly created specialty as @specialty" do
        post :create, {:speciality => valid_attributes}
        expect(assigns(:speciality)).to be_a(Speciality)
        expect(assigns(:speciality)).to be_persisted
      end

      it "redirects to the created specialty" do
        post :create, {:speciality => valid_attributes}
        expect(response).to redirect_to(Speciality.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved specialty as @specialty" do
        post :create, {:speciality => invalid_attributes}
        expect(assigns(:speciality)).to be_a_new(Speciality)
      end

      it "re-renders the 'new' template" do
        post :create, {:speciality => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for :speciality,name: 'Orthopedists' }

      it "updates the requested specialty" do
        speciality = Speciality.create! valid_attributes
        put :update, {:id => speciality.to_param, :speciality => new_attributes}
        speciality.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested specialty as @specialty" do
        speciality = Speciality.create! valid_attributes
        put :update, {:id => speciality.to_param, :speciality => valid_attributes}
        expect(assigns(:speciality)).to eq(speciality)
      end

      it "redirects to the specialty" do
        speciality = Speciality.create! valid_attributes
        put :update, {:id => speciality.to_param, :speciality => valid_attributes}
        expect(response).to redirect_to(speciality)
      end
    end

    context "with invalid params" do
      it "assigns the specialty as @specialty" do
        speciality = Speciality.create! valid_attributes
        put :update, {:id => speciality.to_param, :speciality => invalid_attributes}
        expect(assigns(:speciality)).to eq(speciality)
      end

      it "re-renders the 'edit' template" do
        speciality = Speciality.create! valid_attributes
        put :update, {:id => speciality.to_param, :speciality => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested specialty" do
      speciality = Speciality.create! valid_attributes
      expect {
        delete :destroy, {:id => speciality.to_param}
      }.to change(Speciality, :count).by(-1)
    end

    it "redirects to the specialties list" do
      speciality = Speciality.create! valid_attributes
      delete :destroy, {:id => speciality.to_param}
      expect(response).to redirect_to(specialities_url)
    end
  end
end
