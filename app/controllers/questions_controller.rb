class QuestionsController < ApplicationController

  before_action :find_question, except: %i[index new create]
  before_action :find_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions }
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    not_implemented
  end

  #views/questions/new.html.erb
  def new
  end

  def show
    render json: @question
  end

  def update
    not_implemented
  end

  def destroy
    @question.destroy
    redirect_to '/tests'
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'question was not found'
  end
end
