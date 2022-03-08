class User::QuizzesController < ApplicationController
  def index

     arr = Quiz.all.pluck(:id) # arr = ["1","2","3"...]

    if params[:count]
      # 2問~10問
      new_arr = arr - params[:used_quizes].split(",").map(&:to_i)
      # arr - params[:used_quizes]　回答した問題をarr配列から引いていく

      @quiz = Quiz.find(new_arr.shuffle[0])
      # すでに答えた問題を抜いた配列の中からランダムで出題

      @count = params[:count].to_i + 1
      @used_quizes = params[:used_quizes].split(",").push(@quiz.id).join(",")
      # split(",") 配列にし、出題した問題を配列にいれ、表示するためにjoinを使用

    else
      #1問目
      @count = 1
      @quiz = Quiz.find(arr.shuffle[0])
      @used_quizes = @quiz.id
    end

    def new
      @player = current_player
    end

  end
end
