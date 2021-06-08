class TestsController < ApplicationController

  before_action :find_test, except: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render json: { tests: Test.all }
  end

  #Пока не работает, для создания все еще нужно указывать категорию
  def create
    not_implemented
  end

  #views/tests/new.html.erb
  def new
  end

  def edit
    not_implemented
  end

  def show
    render json: { test: @test }
  end

  def update
    not_implemented
  end

  def destroy
    @test.destroy
    redirect_to '/tests'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def rescue_with_test_not_found
    render plain: 'test was not found'
  end
end
