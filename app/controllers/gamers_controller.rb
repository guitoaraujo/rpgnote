class GamersController < ApplicationController

  def new
    @gamer = Gamer.new
    @users = User.all.order(:email)
  end

  def create
    user = User.where(email: gamer_params[:user_email]).first
    redirect_to game_path(gamer_params[:game_id]), notice: 'usuario nao existe' if user.nil?

    @gamer = Gamer.new(game_id: gamer_params[:game_id], user_id: user.id)
    if @gamer.save
      redirect_to game_path(gamer_params[:game_id]), notice: 'Gamer was successfully added.'
    else
      redirect_to game_path(gamer_params[:game_id]), notice: 'deu ruim'
    end
  end

  def destroy
    gamer = Gamer.find(params[:id])
    game = gamer.game_id
    gamer.destroy
    redirect_back fallback_location: game_path(game), notice: 'Gamer was successfully deleted.'
  end

  private

  def gamer_params
    params.require(:gamer).permit(:game_id, :user_email)
  end

end