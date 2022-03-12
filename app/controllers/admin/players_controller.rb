class Admin::PlayersController < ApplicationController
  def index
    @players = Player.page(params[:page]).per(10)
  end
end
