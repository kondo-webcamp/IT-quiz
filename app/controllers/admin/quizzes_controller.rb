class Admin::QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end

  def index
    @quizzes = Quiz.all
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.save
    redirect_to admin_quizzes_path
  end

  private
  def quiz_params
    params.require(:quiz).permit(:question, :answer, :choices_first, :choices_second, :choices_third, :choices_fourth, :explanation)
  end
end
