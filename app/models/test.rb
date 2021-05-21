class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :users, through: :passed_tests
  has_many :passed_tests, dependent: :destroy

  def self.sorted_by_category(category)
    Test
    .joins(:category)
    .where('categories.title = ?', category)
    .order(title: :desc)
    .pluck(:title)
  end
end
