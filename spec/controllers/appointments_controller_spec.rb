require 'rails_helper'

describe AppointmentsController, type: :controller do
  let(:doctor)  { create(:doctor) }
  let(:patient) { create(:patient) }
  let(:valid_attributes) { attributes_for(:appointment, doctor_id: doctor.id, patient_id: patient.id) }
  let(:invalid_attributes) { attributes_for(:appointment, start_at: Time.current) }
  let(:valid_session) { {} }

   before do
    ailment      = create(:ailment)
    specialty    = create(:specialty)
    @patient     = create(:patient, ailments: [ailment])
    @doctor      = create(:doctor, specialty: specialty)
    @appointment = Appointment.create valid_attributes
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Appointment" do
        expect {
          post :create, patient_id: @patient, appointment: valid_attributes.merge(valid_session)
        }.to change(Appointment, :count).by(1)
      end

      it "assigns a newly created appointment as @appointment" do
        post :create, patient_id: @patient, appointment: valid_attributes.merge(valid_session)
        expect(assigns(:appointment)).to be_a(Appointment)
        expect(assigns(:appointment)).to be_persisted
      end

      it "redirects to the created appointment" do
        post :create, patient_id: @patient, appointment: valid_attributes.merge(valid_session)
        expect(response).to redirect_to(@patient)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved appointment as @appointment" do
        post :create, patient_id: @patient, appointment: invalid_attributes
        expect(assigns(:appointment)).to be_a_new(Appointment)
      end
    end
  end
end
