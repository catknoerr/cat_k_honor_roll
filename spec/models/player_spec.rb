require "rails_helper"

RSpec.describe Player, type: :model do
  describe "Direct Associations" do
    it { should have_many(:users) }

    it { should have_many(:reviews) }

    it { should have_many(:games) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
