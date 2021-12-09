class PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy]

  # GET /players
  def index
    @q = Player.ransack(params[:q])
    @players = @q.result(distinct: true).includes(:games, :reviews,
                                                  :users).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@players.where.not(location_latitude: nil)) do |player, marker|
      marker.lat player.location_latitude
      marker.lng player.location_longitude
      marker.infowindow "<h5><a href='/players/#{player.id}'>#{player.username}</a></h5><small>#{player.location_formatted_address}</small>"
    end
  end

  # GET /players/1
  def show
    @user = User.new
    @review = Review.new
    @game = Game.new
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit; end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: "Player was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      redirect_to @player, notice: "Player was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
    redirect_to players_url, notice: "Player was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def player_params
    params.require(:player).permit(:username, :photo, :location, :age,
                                   :description, :preferences, :characters)
  end
end
