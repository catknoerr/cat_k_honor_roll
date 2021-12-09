class DungeonmastersController < ApplicationController
  before_action :set_dungeonmaster, only: [:show, :edit, :update, :destroy]

  # GET /dungeonmasters
  def index
    @q = Dungeonmaster.ransack(params[:q])
    @dungeonmasters = @q.result(:distinct => true).includes(:reviews, :users, :games).page(params[:page]).per(10)
  end

  # GET /dungeonmasters/1
  def show
    @game = Game.new
    @user = User.new
    @review = Review.new
  end

  # GET /dungeonmasters/new
  def new
    @dungeonmaster = Dungeonmaster.new
  end

  # GET /dungeonmasters/1/edit
  def edit
  end

  # POST /dungeonmasters
  def create
    @dungeonmaster = Dungeonmaster.new(dungeonmaster_params)

    if @dungeonmaster.save
      redirect_to @dungeonmaster, notice: 'Dungeonmaster was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dungeonmasters/1
  def update
    if @dungeonmaster.update(dungeonmaster_params)
      redirect_to @dungeonmaster, notice: 'Dungeonmaster was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dungeonmasters/1
  def destroy
    @dungeonmaster.destroy
    redirect_to dungeonmasters_url, notice: 'Dungeonmaster was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dungeonmaster
      @dungeonmaster = Dungeonmaster.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dungeonmaster_params
      params.require(:dungeonmaster).permit(:description, :preferences, :photo, :years_experience, :age, :characters)
    end
end
