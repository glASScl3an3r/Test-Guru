# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :normal, 2 => :hard, 3 => :master }.freeze

  def test_difficulty(test)
    TEST_LEVELS.fetch(test.level, :incredible)
  end
end
