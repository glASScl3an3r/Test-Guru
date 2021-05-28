class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :text, presence: true
  validates :correct,  inclusion: { in: [true, false] }
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:question, :too_many_answers) if question.present? && question.answers.count >= 4
  end
end
