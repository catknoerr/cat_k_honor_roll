class DungeonmastersController < ApplicationController
  before_action :set_dungeonmaster, only: %i[show edit update destroy]

  def index
    @q = Dungeonmaster.ransack(params[:q])
    @dungeonmasters = @q.result(distinct: true).includes(:reviews, :users,
                                                         :games).page(params[:page]).per(10)
  end

  def show
    @game = Game.new
    @user = User.new
    @review = Review.new
  end

  def new
    @dungeonmaster = Dungeonmaster.new
  end

  def edit; end

  def create
    @dungeonmaster = Dungeonmaster.new(dungeonmaster_params)

    if @dungeonmaster.save
      redirect_to @dungeonmaster,
                  notice: "Dungeonmaster was successfully created."
    else
      render :new
    end
  end

  def update
    if @dungeonmaster.update(dungeonmaster_params)
      redirect_to @dungeonmaster,
                  notice: "Dungeonmaster was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @dungeonmaster.destroy
    redirect_to dungeonmasters_url,
                notice: "Dungeonmaster was successfully destroyed."
  end

  private

  def set_dungeonmaster
    @dungeonmaster = Dungeonmaster.find(params[:id])
  end

  def dungeonmaster_params
    params.require(:dungeonmaster).permit(:description, :preferences, :photo,
                                          :years_experience, :age, :characters)
  end
end
