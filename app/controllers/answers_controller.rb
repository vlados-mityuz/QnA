class AnswersController < ApplicationController
  before_action :find_question, only: %i[create]

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question, notice: 'Answer was successfully created'
    else
      @question.reload
      render "questions/show"
    end
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer
    @answer ||= params[:id] ? Answer.find(params[:id]) : @question.answers.new
  end

  helper_method :answer

  def answer_params
    params.require(:answer).permit(:body)
  end
end
