class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  def index
    @q = Game.ransack(params[:q])
    @games = @q.result(:distinct => true).includes(:dm, :player).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@games.where.not(:location_latitude => nil)) do |game, marker|
      marker.lat game.location_latitude
      marker.lng game.location_longitude
      marker.infowindow "<h5><a href='/games/#{game.id}'>#{game.dm_id}</a></h5><small>#{game.location_formatted_address}</small>"
    end
  end

  # GET /games/1
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      message = 'Game was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @game, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    message = "Game was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to games_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:dm_id, :player_id, :date, :time, :capacity, :location)
    end
end
