class PassedTestsController < ApplicationController

  before_action :find_passed_test, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      TestsMailer.completed_test(@passed_test).deliver_now
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  def gist
    res = GistQuestionService.new(@passed_test.current_question).call

    flash_options = if res[:success]
      create_gist(res[:url])
      { notice: "Gist created: #{res[:url]}" }
    else
      { alert: "error: gist wasnt created" }
    end

    redirect_to @passed_test, flash_options
  end

  private

  def find_passed_test
    @passed_test = PassedTest.find(params[:id])
  end

  def create_gist(url)
    current_user.gists.create(url: url, question: @passed_test.current_question)
  end

end
