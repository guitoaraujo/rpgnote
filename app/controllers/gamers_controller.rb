class GamersController < ApplicationController

  def new
    @gamer = Gamer.new

    @users = User.all.order(:email)
  end

  def create
  end

  private

  def gamer_params
    params.require(:gamer).permit(:game_id, :gamers[])
  end

end