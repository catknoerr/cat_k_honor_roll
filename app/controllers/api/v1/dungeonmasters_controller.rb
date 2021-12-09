class Api::V1::DungeonmastersController < Api::V1::GraphitiController
  def index
    dungeonmasters = DungeonmasterResource.all(params)
    respond_with(dungeonmasters)
  end

  def show
    dungeonmaster = DungeonmasterResource.find(params)
    respond_with(dungeonmaster)
  end

  def create
    dungeonmaster = DungeonmasterResource.build(params)

    if dungeonmaster.save
      render jsonapi: dungeonmaster, status: 201
    else
      render jsonapi_errors: dungeonmaster
    end
  end

  def update
    dungeonmaster = DungeonmasterResource.find(params)

    if dungeonmaster.update_attributes
      render jsonapi: dungeonmaster
    else
      render jsonapi_errors: dungeonmaster
    end
  end

  def destroy
    dungeonmaster = DungeonmasterResource.find(params)

    if dungeonmaster.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: dungeonmaster
    end
  end
end
