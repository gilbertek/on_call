class AppointmentMailer < ApplicationMailer
  helper :appointments

  def patient_new_appointment(appointment)
    @appointment = appointment
    @patient     = @appointment.patient
    @doctor      = @appointment.doctor

    mail(to: @patient.email, subject: "Your appointment with #{@doctor.name} is confirmed")
  end

  def doctor_new_appointment(appointment)
    @appointment = appointment
    @patient     = @appointment.patient
    @doctor      = @appointment.doctor

    mail(to: @doctor.email, subject: "New patient appointment")
  end
end
