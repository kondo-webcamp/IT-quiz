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

  private
  def player_params
    params.require(:player).permit(:player_name, :email, :introduction,:image_icon)
  end
end
