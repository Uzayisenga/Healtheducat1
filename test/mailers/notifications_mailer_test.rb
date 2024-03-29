require 'test_helper'

class NotificationsMailerTest < ActionMailer::TestCase
  test "forgot_password" do
    mail = NotificationsMailer.forgot_password
    assert_equal "Forgot password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "activate" do
    mail = NotificationsMailer.activate
    assert_equal "Activate", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
