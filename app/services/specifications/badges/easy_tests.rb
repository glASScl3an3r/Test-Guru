class Specifications::Badges::EasyTests
  def self.satisfied?(passed_test, badge)
    user = passed_test.user
    return false if user.has_already?(badge)
    
    level = badge.rule_value.to_i
    Test.by_level(level).count == user.passed_tests.by_level(level).solved.without_repetitions.count
  end
end
