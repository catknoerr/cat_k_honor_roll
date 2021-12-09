json.extract! player, :id, :username, :photo, :location, :age, :description, :preferences, :characters, :created_at, :updated_at
json.url player_url(player, format: :json)
