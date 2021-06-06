class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question
  skip_before_action :find_question, only: %i[index new destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions }
  end

  def create
    question = Question.create(question_params)
    question.test_id = @test.id
    question.save!
    render plain: 'question created!'
  end

  def edit
    not_implemented
  end

  #views/questions/new.html.erb
  def new
  end

  def show
    puts params.inspect
  end

  #Показывает вопросы не по id, а по индексу в списке вопросов конкретного теста
  #Вопросы отсортированы по времени создания(в будущем мб поменяется)
  #т.е. tests/1/questions/0 - первый вопрос теста c id = 1
  def show_ordered
    render json: { question: @question }
  end

  def update
    not_implemented
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  def destroy_ordered
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    question_num = params[:question_num].to_i
    @question = @test.questions[question_num]
    raise ActiveRecord::RecordNotFound if question_num < 0 || @question.nil?
  end

  def rescue_with_question_not_found
    render plain: 'question was not found'
  end
end
