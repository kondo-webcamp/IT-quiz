class User::QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.order("RANDOM()").limit(1)
  end
end
