class User < ApplicationRecord
  def tests_by_level(level)
    Test
      .joins('JOIN passed_tests ON passed_tests.test_id = tests.id')
      .where('level = ? AND user_id = ?', level, id)
  end
end
