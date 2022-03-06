class Admin::RequestQuizzesController < ApplicationController
  def index
    @request_quizzes = RequestQuiz.all
  end

  def show
    @request_quiz = RequestQuiz.find(params[:id])
  end
end
