class GameResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dm_id, :integer
  attribute :player_id, :integer
  attribute :date, :date
  attribute :time, :string
  attribute :capacity, :integer
  attribute :location, :string

  # Direct associations

  belongs_to :player

  belongs_to :dm,
             resource: DungeonmasterResource

  # Indirect associations

end
