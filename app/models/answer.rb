class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :correct, inclusion: { in: [ true, false ] }
  validate :validate_answers_count

  scope :right, -> { where(correct: true) }

  private

  def validate_answers_count
    # если на данный момент 4 вопроса, при добавлении нового будет ошибка
    errors.add(:question, :too_many_answers) if !question.nil? && question.answers.count >= 4
    for i in errors do
      puts i.message
    end
  end
end
