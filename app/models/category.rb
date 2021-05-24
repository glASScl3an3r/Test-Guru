class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  default_scope { order(title: :asc) }
end
