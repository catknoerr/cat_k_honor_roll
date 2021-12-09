class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :location, :string
  attribute :username, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :dm_id, :integer
  attribute :player_id, :integer

  # Direct associations

  belongs_to :player

  belongs_to :dm,
             resource: DungeonmasterResource

  # Indirect associations
end
