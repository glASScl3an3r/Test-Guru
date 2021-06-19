class Question < ApplicationRecord
  belongs_to :test
  has_many  :answers,
            -> { order 'created_at' },
            dependent: :destroy

  validates :text, presence: true
end
