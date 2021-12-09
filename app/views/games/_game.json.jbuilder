json.extract! game, :id, :dm_id, :player_id, :date, :time, :capacity,
              :location, :created_at, :updated_at
json.url game_url(game, format: :json)
