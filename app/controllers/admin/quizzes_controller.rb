class Admin::QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end

  def index
    @quizzes = Quiz.page(params[:page]).per(10)
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.save
    redirect_to admin_quizzes_path
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    @quiz.update(quiz_params)
    flash[:notice] = "変更しました"
    redirect_to admin_quizzes_path
  end

  private
  def quiz_params
    params.require(:quiz).permit(:question, :answer, :choices_first, :choices_second, :choices_third, :choices_fourth, :explanation)
  end
end
