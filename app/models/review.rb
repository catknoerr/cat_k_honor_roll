class Review < ApplicationRecord
  # Direct associations

  belongs_to :player,
             foreign_key: "reviewer_id"

  belongs_to :dm,
             class_name: "Dungeonmaster",
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dm.to_s
  end
end
