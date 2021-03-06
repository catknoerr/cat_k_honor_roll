require "rails_helper"

RSpec.describe "players#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/players/#{player.id}", payload
  end

  describe "basic update" do
    let!(:player) { create(:player) }

    let(:payload) do
      {
        data: {
          id: player.id.to_s,
          type: "players",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PlayerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { player.reload.attributes }
    end
  end
end
