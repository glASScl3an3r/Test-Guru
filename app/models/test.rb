class Test < ApplicationRecord
  def self.sorted_by_category(category)
    Test
      .joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ?', category)
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
