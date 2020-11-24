require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'creation' do
    it 'can be created' do
      appointment = Appointment.create(patient_id: "1", doctor_id: "2", appointment_date: DateTime.now)
      expect(appointment).to be_valid
    end
  end
end
