class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit
  end

  def new
    @test = current_user.created_tests.new
  end

  def show
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level)
  end

end
