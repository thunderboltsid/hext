class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:send_sms, :create]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def send_sms
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to:   ENV["MY_PHONE_NUMBER"],
      body: 'Hey there!'
    )
  end

  def create
    @question = Question.new(twilio_question_params)

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    def set_client
      @client = Twilio::REST::Client.new
    end

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:message, :phone_number)
    end

    def twilio_question_params
      {
        phone_number: params["From"],
        message:      params["Body"]
      }
    end
end
