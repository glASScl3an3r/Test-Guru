class BadgeService
  def initialize(passed_test)
    @passed_test = passed_test
  end

  def call
    Badge.select do |badge|
      if eval "Specifications::Badges::#{badge.rule.camelize}.satisfied?(@passed_test, badge)"
        @passed_test.user.badges.push(badge)
      end
    end
  end
end
