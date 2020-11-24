require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  describe 'GET #index' do
    before do
      get :index
    end

    it 'is expected to assign appointment instance variable' do
      expect(assigns[:appointments]).to eq(Appointment.all)
    end
  end
end
