# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers,
           -> { order 'created_at' },
           dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :text, presence: true
end
