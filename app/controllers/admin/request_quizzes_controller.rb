class Admin::RequestQuizzesController < ApplicationController
  def index
    @request_quizzes = RequestQuiz.all
  end

  def show
    @request_quiz = RequestQuiz.find(params[:id])
  end

  def destroy
    @request_quiz = RequestQuiz.find(params[:id])
    @request_quiz.destroy
    redirect_to new_admin_session_path
  end
end
