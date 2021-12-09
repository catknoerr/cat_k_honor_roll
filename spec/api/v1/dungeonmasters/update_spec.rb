require 'rails_helper'

RSpec.describe "dungeonmasters#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/dungeonmasters/#{dungeonmaster.id}", payload
  end

  describe 'basic update' do
    let!(:dungeonmaster) { create(:dungeonmaster) }

    let(:payload) do
      {
        data: {
          id: dungeonmaster.id.to_s,
          type: 'dungeonmasters',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DungeonmasterResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { dungeonmaster.reload.attributes }
    end
  end
end
