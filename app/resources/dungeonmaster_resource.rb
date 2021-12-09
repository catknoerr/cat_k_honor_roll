class DungeonmasterResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :description, :string
  attribute :preferences, :string
  attribute :photo, :string
  attribute :years_experience, :integer
  attribute :age, :integer
  attribute :characters, :string

  # Direct associations

  has_many   :users,
             foreign_key: :dm_id

  has_many   :reviews,
             foreign_key: :dm_id

  # Indirect associations

end
