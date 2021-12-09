class PlayerResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :username, :string
  attribute :photo, :string
  attribute :location, :string
  attribute :age, :integer
  attribute :description, :string
  attribute :preferences, :string
  attribute :characters, :string

  # Direct associations

  has_many   :games

  # Indirect associations

end
