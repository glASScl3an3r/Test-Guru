class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :users, through: :passed_tests
  has_many :passed_tests, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, presence: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0
                                  }

  scope :easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :medium, -> { where(level: 2..4).order(created_at: :desc) }
  scope :hard, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  scope :by_category, -> (category) { joins(:category)
                                      .where('categories.title = ?', category)
                                      .order(title: :desc)
                                    }
  scope :by_level, -> (level) { where(level: level) }

  def self.sorted_by_category(category)
    by_category(category).pluck(:title)
  end
end
