json.extract! user, :id, :location, :username, :first_name, :last_name, :dm_id, :player_id, :created_at, :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt