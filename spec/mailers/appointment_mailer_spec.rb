require "rails_helper"

describe AppointmentMailer, type: :mailer do
  include AppointmentsHelper

  before do
    @appointment = create(:appointment)
  end

  describe "patient create new appointment" do
    before do
      @patient = @appointment.patient
      @mail    = AppointmentMailer.patient_new_appointment(@appointment)
    end

    it "send appointment confirmation email to patient with start time info" do
      expect(@mail.subject).to eq("Your appointment with #{@appointment.doctor.name} is confirmed")
      expect(@mail.to).to eq([@patient.email])
      expect(@mail.body).to include display_date_format(@appointment.start_at)
    end
  end

  describe "doctor receive new appointment" do
    before do
      @doctor = @appointment.doctor
      @mail   = AppointmentMailer.doctor_new_appointment(@appointment)
    end

    it "send new appointment info to doctor" do
      expect(@mail.subject).to eq("New patient appointment")
      expect(@mail.to).to eq([@doctor.email])
      expect(@mail.body.encoded).to include display_date_format(@appointment.start_at)
    end
  end
end
