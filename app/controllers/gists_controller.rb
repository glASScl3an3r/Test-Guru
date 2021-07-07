class GistsController < ApplicationController

  before_action :find_passed_test, only: %i[create]

  def create
    res = GistQuestionService.new(@passed_test.current_question).call

    flash_options = if res.success?
      create_gist(res.url)
      { notice: "Gist created: #{res.url}" }
    else
      { alert: "error: gist wasnt created" }
    end

    redirect_to @passed_test, flash_options
  end

  private

  def create_gist(url)
    current_user.gists.create!(url: url, question: @passed_test.current_question)
  end

  def find_passed_test
    @passed_test = PassedTest.find(params[:passed_test_id])
  end

end
