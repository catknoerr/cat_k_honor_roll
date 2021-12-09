class Game < ApplicationRecord
  # Direct associations

  belongs_to :dm,
             :class_name => "Dungeonmaster"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dm.to_s
  end

end
