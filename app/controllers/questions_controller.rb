class QuestionsController < ApplicationController

  before_action :find_question, except: %i[index new destroy create]
  before_action :find_test, only: %i[index new create show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions }
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to controller: :questions,
                  action: :show,
                  id: @question,
                  test_id: @test,
                  notice: 'question created!'
    else
      redirect_to controller: :questions,
                  action: :new,
                  test_id: @test,
                  alert: 'invalid params!'
    end
  end

  def edit
    not_implemented
  end

  #views/questions/new.html.erb
  def new
  end

  def show
    raise ActiveRecord::RecordNotFound if @question.test != @test
    render json: @question
  end

  def update
    not_implemented
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    puts params.inspect
    params.permit(:test_id)
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
