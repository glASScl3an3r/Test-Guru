class User < ApplicationRecord
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true

  def tests_by_level(level)
    tests.by_level(level)
  end

  def passed_test(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
