class Specifications::Badges::FullPassedTest
  def self.satisfied?(passed_test, badge)
    passed_test.pass_percent == 100
  end
end
