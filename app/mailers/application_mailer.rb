class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <EvaNmail@testguru.ru>}
  layout 'mailer'
end
