json.extract! appointment, :id, :appointment_date, :photos, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
