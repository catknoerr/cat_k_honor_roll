class Player < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :foreign_key => "reviewer_id",
             :dependent => :destroy

  has_many   :games,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    username
  end

end
