require "rails_helper"

RSpec.describe "dungeonmasters#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dungeonmasters", params: params
  end

  describe "basic fetch" do
    let!(:dungeonmaster1) { create(:dungeonmaster) }
    let!(:dungeonmaster2) { create(:dungeonmaster) }

    it "works" do
      expect(DungeonmasterResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["dungeonmasters"])
      expect(d.map(&:id)).to match_array([dungeonmaster1.id, dungeonmaster2.id])
    end
  end
end
