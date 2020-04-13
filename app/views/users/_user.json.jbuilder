json.extract! user, :id, :login, :clearance, :name, :surname, :email, :ip_address, :salt, :hashed_password, :activated, :created_at, :updated_at
json.url user_url(user, format: :json)
