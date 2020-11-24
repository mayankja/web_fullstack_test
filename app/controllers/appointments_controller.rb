class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.where(patient_id: current_user.id)
    patient_ids = @appointments.map(&:patient_id)
    doctor_ids = @appointments.map(&:doctor_id)
    @patients = User.where(id: patient_ids)
    @doctors = User.where(id: doctor_ids)
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    doctor_list = User.where(role: 'Doctor')
    @doctor_hash = doctor_list.map{|h| [h.first_name, h.id]}.to_h
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
    doctor_list = User.where(role: 'Doctor')
    @doctor_hash = doctor_list.map{|h| [h.first_name, h.id]}.to_h
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient_id = current_user.id
    @appointment.doctor_id = params[:appointment][:doctor_id]
    doctor_list = User.where(role: 'Doctor')
    @doctor_hash = doctor_list.map{|h| [h.first_name, h.id]}.to_h

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
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

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:appointment_date, {photos: []}, :doctor_id, :patient_id)
    end
end
