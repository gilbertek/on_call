class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        send_new_appointment_emails
        format.html { redirect_to @patient, notice: 'Appointment was successfully created.' }
      else
        format.html { redirect_to @patient, notice: 'Unable to create appointment.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:patient_id])
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to @patient, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:patient_id, :doctor_id, :start_at)
    end

    def normalize_start_time
      year   = appointment_params[:"start_at(1i)"].to_i
      month  = appointment_params[:"start_at(2i)"].to_i
      day    = appointment_params[:"start_at(3i)"].to_i
      hour   = appointment_params[:"start_at(4i)"].to_i
      minute = appointment_params[:"start_at(5i)"].to_i

      Time.zone.parse("#{year}-#{month}-#{day} #{hour}:#{minute}")
    end

    def send_new_appointment_emails
       %w(patient doctor).each do |participant|
        AppointmentMailer.send("#{participant}_new_appointment", @appointment).deliver_now
      end
    end
end
