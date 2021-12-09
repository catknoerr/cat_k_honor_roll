require "rails_helper"

RSpec.describe Dungeonmaster, type: :model do
  describe "Direct Associations" do
    it { should have_many(:games) }

    it { should have_many(:users) }

    it { should have_many(:reviews) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
