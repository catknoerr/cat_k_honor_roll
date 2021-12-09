class Api::V1::PlayersController < Api::V1::GraphitiController
  def index
    players = PlayerResource.all(params)
    respond_with(players)
  end

  def show
    player = PlayerResource.find(params)
    respond_with(player)
  end

  def create
    player = PlayerResource.build(params)

    if player.save
      render jsonapi: player, status: :created
    else
      render jsonapi_errors: player
    end
  end

  def update
    player = PlayerResource.find(params)

    if player.update_attributes
      render jsonapi: player
    else
      render jsonapi_errors: player
    end
  end

  def destroy
    player = PlayerResource.find(params)

    if player.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: player
    end
  end
end
