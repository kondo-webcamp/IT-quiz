class User::PlayersController < ApplicationController
  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    flash[:notice] = "変更しました"
    redirect_to request.referer
  end
  
  def score_update
    @quiz = Quiz.find(params[:id])
    answer = params[:answer]
    if @quiz.answer == answer
      current_player.update(score: current_player.score + 1)
    end
  end

  private
  def player_params
    params.require(:player).permit(:player_name, :email, :introduction,:image_icon)
  end
end
