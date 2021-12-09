class Dungeonmaster < ApplicationRecord
  # Direct associations

  has_many   :users,
             :foreign_key => "dm_id",
             :dependent => :destroy

  has_many   :reviews,
             :foreign_key => "dm_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
