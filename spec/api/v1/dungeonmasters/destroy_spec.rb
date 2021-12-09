require 'rails_helper'

RSpec.describe "dungeonmasters#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/dungeonmasters/#{dungeonmaster.id}"
  end

  describe 'basic destroy' do
    let!(:dungeonmaster) { create(:dungeonmaster) }

    it 'updates the resource' do
      expect(DungeonmasterResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Dungeonmaster.count }.by(-1)
      expect { dungeonmaster.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
