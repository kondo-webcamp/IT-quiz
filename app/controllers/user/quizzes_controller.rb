class User::QuizzesController < ApplicationController
  def index
     quiz_all_list = Quiz.all.pluck(:id) # quiz_all_list = ["1","2","3"...]
    if params[:count]
      # 2問~10問
      quiz_list = quiz_all_list - params[:used_quizzes].split(",").map(&:to_i)
      # quiz_all_list - params[:used_quizzes]　回答した問題をquiz_all_list配列から引いていく

      @quiz = Quiz.find(quiz_list.shuffle[0])
      # すでに答えた問題を抜いた配列の中からランダムで出題

      @count = params[:count].to_i + 1
      @used_quizzes = params[:used_quizzes].split(",").push(@quiz.id).join(",")
      # split(",") 配列にし、出題した問題を配列にいれ、表示するためにjoinを使用
    else
      #1問目
      @count = 1
      @quiz = Quiz.find(quiz_all_list.shuffle[0])
      @used_quizzes = @quiz.id
    end

    def new
      @player = current_player
    end

  end
end
