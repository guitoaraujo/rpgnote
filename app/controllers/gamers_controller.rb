class GamersController < ApplicationController

  def create
    @gamer = Gamer.new(gamer_params)

    respond_to do |format|
      if @gamer.save
        format.html { redirect_to @game, notice: 'Gamer was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def gamer_params
    params.require(:gamer).permit(:game_id, :user_id)
  end

end