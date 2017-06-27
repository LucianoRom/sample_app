class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update, :new, :create, :destroy]
  before_action :correct_user_or_admin, only: [:edit, :update, :destroy]


  # GET /games
  # GET /games.json
  def index
    @games = Game.all
@gamcount = [Game.count, 10]
    respond_to do |format|
      format.html
      format.json { render json: @gamcount }
    end
  end

  # GET /games/1
  # GET /games/1.json
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
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to games_url, notice: 'Game was successfully created.' }
        format.json { render :index, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to games_url, notice: 'Game was successfully updated.' }
        format.json { render :index, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params.require(:game).permit(:name, :duree_id, :complexite_id, :user_id,:version_ids => [], :ambiance_ids => [], :age_ids=> [], :thematique_ids => [], :nbjoueur_ids => [], :style_ids => [])
  end
  def correct_user_or_admin
    @game = Game.find(params[:id])
    @user = @game.user
    redirect_to('/games') unless current_user?(@user)||current_user.admin?
  end

end