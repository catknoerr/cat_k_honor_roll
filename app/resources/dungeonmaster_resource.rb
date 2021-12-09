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

  # Indirect associations

end
