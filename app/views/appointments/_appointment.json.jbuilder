json.extract! appointment, :id, :content, :user_id, :day, :month, :year, :hours, :minutes, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)