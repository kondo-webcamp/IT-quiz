class User::RequestQuizzesController < ApplicationController
  def new
    @request_quiz = RequestQuiz.new
  end

  def create
    @request_quiz = RequestQuiz.new(request_quiz_params)
    @request_quiz.save
    redirect_to user_request_quizzes_path
  end

  private
  def request_quiz_params
    params.require(:request_quiz).permit(:question, :answer, :choices_first, :choices_second, :choices_third, :choices_fourth, :explanation)
  end
end
