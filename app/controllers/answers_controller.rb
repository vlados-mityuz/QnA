class AnswersController < ApplicationController
  before_action :question, only: %i[new create]

  def show

  end

  def new
    
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question
    else
      render :new
    end
  end

  private

  def question
    @question = Question.find(params[:question_id])
  end

  def answer
    @answer ||= params[:id] ? Answer.find(params[:id]) : @question.answers.new
  end

  helper_method :answer

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
