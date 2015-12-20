class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_question, only: [:index, :new, :create]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:create]

  def index
    @answers = @question.answers.reverse
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]

    if @answer.save
      @client.messages.create(
        from: ENV["TWILIO_PHONE_NUMBER"],
        to:   @question.phone_number,
        body: @answer.text
      )
      redirect_to question_answers_url(@question), notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to answers_url, notice: 'Answer was successfully destroyed.'
  end

  private
    def set_client
      @client = Twilio::REST::Client.new
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    def answer_params
      params.require(:answer).permit(:user_id, :text)
    end
end
