class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :correct,  inclusion: { in: [true, false] }
  validate :validate_answers_count, on: :create

  scope :right, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:question, :too_many_answers) if question.answers.count >= 4
  end
end
