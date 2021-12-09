class Player < ApplicationRecord
  # Direct associations

  has_many   :games,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    username
  end

end
