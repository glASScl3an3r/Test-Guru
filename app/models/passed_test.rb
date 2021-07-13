# frozen_string_literal: true

class PassedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  SUCCESS_PERCENT = 85

  def accept!(answer_ids)
    if time_over?
      self.current_question = nil
      save!
      return
    end

    self.correct_questions += 1 if answer_correct?(answer_ids)

    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  #процент верно отвеченных
  def pass_percent
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  #процент пройденных вопросов
  def progress_percent
    (((question_number - 1).to_f / test.questions.count) * 100).to_i
  end

  def passed?
    pass_percent > SUCCESS_PERCENT
  end

  def start_time
    created_at
  end

  def end_time
    start_time + test.timer.seconds
  end

  def seconds_left
    (end_time - Time.current).to_i
  end

  def time_over?
    seconds_left <= 0
  end

  def question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def answer_correct?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.right
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
