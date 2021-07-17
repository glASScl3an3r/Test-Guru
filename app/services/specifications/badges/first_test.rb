class Specifications::Badges::FirstTest
  def self.satisfied?(passed_test, badge)
    passed_test.user.passed_tests.count > 0 && !passed_test.user.has_already?(badge)
  end
end
