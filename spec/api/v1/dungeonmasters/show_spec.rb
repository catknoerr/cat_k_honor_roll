require 'rails_helper'

RSpec.describe "dungeonmasters#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dungeonmasters/#{dungeonmaster.id}", params: params
  end

  describe 'basic fetch' do
    let!(:dungeonmaster) { create(:dungeonmaster) }

    it 'works' do
      expect(DungeonmasterResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('dungeonmasters')
      expect(d.id).to eq(dungeonmaster.id)
    end
  end
end
