class AppointmentMailer < ApplicationMailer
  helper :appointments

  def patient_new_appointment(appointment)
    @appointment = appointment
    set_doctor_and_patient
    mail(to: @patient.email, subject: "Your upcoming appointment with #{@doctor.name}")
  end

  def doctor_new_appointment(appointment)
    @appointment = appointment
    set_doctor_and_patient
    mail(to: @doctor.email, subject: "New patient appointment")
  end

  def set_doctor_and_patient
    @patient = @appointment.patient
    @doctor = @appointment.doctor
  end
end
