class PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy]

  def index
    @q = Player.ransack(params[:q])
    @players = @q.result(distinct: true).includes(:games, :reviews,
                                                  :users).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@players.where.not(location_latitude: nil)) do |player, marker|
      marker.lat player.location_latitude
      marker.lng player.location_longitude
    end
  end

  def show
    @user = User.new
    @review = Review.new
    @game = Game.new
  end

  def new
    @player = Player.new
  end

  def edit; end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: "Player was successfully created."
    else
      render :new
    end
  end

  def update
    if @player.update(player_params)
      redirect_to @player, notice: "Player was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to players_url, notice: "Player was successfully destroyed."
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:username, :photo, :location, :age,
                                   :description, :preferences, :characters)
  end
end
