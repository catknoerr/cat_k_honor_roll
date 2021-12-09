class ReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dm_id, :integer
  attribute :rating, :string
  attribute :reviewer_id, :integer
  attribute :review, :string

  # Direct associations

  belongs_to :player,
             foreign_key: :reviewer_id

  belongs_to :dm,
             resource: DungeonmasterResource

  # Indirect associations

end
