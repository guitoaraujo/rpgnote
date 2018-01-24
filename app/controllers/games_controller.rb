class GamesController < ApplicationController
  before_action :authenticate_gamer, except: [:index, :new]
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :set_systems, only: [:new, :create, :edit, :show]
  before_action :set_privacies, only: [:new, :create, :edit, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @note = @game.notes.build
    @users = User.all
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
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
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
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
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

  def set_systems
    @systems = Game.systems.keys
  end

  def set_privacies
    @game_privacies = Game.privacies.keys
    @note_privacies = Note.privacies.keys
  end

  def authenticate_gamer
    @game = Game.find(params[:id])
    if @game.privacy == 'restricted'
      redirect_to root_path unless @game.users.include? current_user
    end
    if @game.privacy == 'private'
      redirect_to root_path unless @game.user == current_user
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params.require(:game).permit(:name, :description, :user_id, :system, :privacy)
  end
end
