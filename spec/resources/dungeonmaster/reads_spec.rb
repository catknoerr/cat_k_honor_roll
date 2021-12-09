require 'rails_helper'

RSpec.describe DungeonmasterResource, type: :resource do
  describe 'serialization' do
    let!(:dungeonmaster) { create(:dungeonmaster) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(dungeonmaster.id)
      expect(data.jsonapi_type).to eq('dungeonmasters')
    end
  end

  describe 'filtering' do
    let!(:dungeonmaster1) { create(:dungeonmaster) }
    let!(:dungeonmaster2) { create(:dungeonmaster) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: dungeonmaster2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([dungeonmaster2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:dungeonmaster1) { create(:dungeonmaster) }
      let!(:dungeonmaster2) { create(:dungeonmaster) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            dungeonmaster1.id,
            dungeonmaster2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            dungeonmaster2.id,
            dungeonmaster1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
