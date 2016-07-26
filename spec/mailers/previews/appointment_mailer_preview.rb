# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview
  def patient_new_appointment
    @appointment = Appointment.last
    @patient     = @appointment.patient
    @doctor      = @appointment.doctor
    mail(to: @patient.email, subject: "Your appointment with #{@doctor.name} id confirmed")
  end

  def doctor_new_appointment
    @appointment = Appointment.last
    @patient     = @appointment.patient
    @doctor      = @appointment.doctor
    mail(to: @doctor.email, subject: "New patient appointment")
  end
end
