class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many  :questions,
            -> { order 'created_at' },
            dependent: :destroy
  has_many  :users,
            through: :passed_tests
  has_many  :passed_tests,
            dependent: :destroy

  validates :title, presence: true
  validates :level, presence: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, -> (level) { where(level: level) }
  scope :by_category, -> (category) { joins(:category).
                                      where('categories.title = ?', category) }

  def self.sorted_by_category(category)
    by_category(category)
    .order(title: :desc)
    .pluck(:title)
  end
end
