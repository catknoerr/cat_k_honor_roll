require "rails_helper"

RSpec.describe "players#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/players/#{player.id}"
  end

  describe "basic destroy" do
    let!(:player) { create(:player) }

    it "updates the resource" do
      expect(PlayerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Player.count }.by(-1)
      expect { player.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
