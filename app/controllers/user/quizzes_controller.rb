class User::QuizzesController < ApplicationController
  def index

     arr = Quiz.all.pluck(:id) # arr = ["1","2","3"...]

    if params[:count]
      # 1問~10問

      new_arr = arr - params[:used_quizes].split("").map(&:to_i)
      # arr - params[:used_quizes]　回答した問題をarr配列から引いていく
      # split("")　答えた問題のidを文字列にする [1]=>["1"]
      # map(&:to_i)  arrの中身全てをintegerに変換　["1","2","3"]=>[1,2,3]

      @quiz = Quiz.find(new_arr.shuffle[0])
      # すでに答えた問題を抜いた配列の中からランダムで出題

      @count =  params[:count].to_i + 1  # "1"=> 1
      @used_quizes = params[:used_quizes].split(",").push(@quiz.id).join(",")
      # split(",") 問題、答え、選択肢などを1つの文字列として変換

    else
      #終了

      @count = 1
      #1問目に戻る 1に戻しておく

      @used_quizes = ""
      @quiz = Quiz.find(arr.shuffle[0])
    end

    def new
      @player = current_player
    end

  end
end
