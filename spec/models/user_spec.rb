require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:player) }

    it { should belong_to(:dm) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
