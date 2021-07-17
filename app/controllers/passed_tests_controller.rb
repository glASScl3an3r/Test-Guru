# frozen_string_literal: true

class PassedTestsController < ApplicationController
  before_action :find_passed_test, only: %i[show result update]

  def show
    redirect_to result_passed_test_path(@passed_test) if @passed_test.completed?
  end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      check_for_badges
      TestsMailer.completed_test(@passed_test).deliver_now
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  private

  def find_passed_test
    @passed_test = PassedTest.find(params[:id])
  end

  def check_for_badges
    given_badges = BadgeService.new(@passed_test).call
    if given_badges.any?
      flash[:notice] = "Получены ачивки: #{given_badges.map{|badge| badge.title}.join(', ')}"
    end
  end
end
