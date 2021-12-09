require 'rails_helper'

RSpec.describe DungeonmasterResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'dungeonmasters',
          attributes: { }
        }
      }
    end

    let(:instance) do
      DungeonmasterResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Dungeonmaster.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:dungeonmaster) { create(:dungeonmaster) }

    let(:payload) do
      {
        data: {
          id: dungeonmaster.id.to_s,
          type: 'dungeonmasters',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      DungeonmasterResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { dungeonmaster.reload.updated_at }
      # .and change { dungeonmaster.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:dungeonmaster) { create(:dungeonmaster) }

    let(:instance) do
      DungeonmasterResource.find(id: dungeonmaster.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Dungeonmaster.count }.by(-1)
    end
  end
end
