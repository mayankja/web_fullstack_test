class HomeController < ApplicationController
  def index
    if current_user.present?
      @appointments = Appointment.where(doctor_id: current_user.id)
      patient_ids = @appointments.map(&:patient_id)
      @patients = User.where(id: patient_ids)
    end
  end
end
