class Specifications::Badges::FullFailedTest
  def self.satisfied?(passed_test, badge)
    passed_test.pass_percent == 0
  end
end
