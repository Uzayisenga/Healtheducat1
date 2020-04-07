require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
   
    users.activation_token = User.new_token
    mail = UserMailer.account_activation
    assert_equal "Account activation", mail.subject
    assert_equal ["auzayisenga@akilahinstitute.org"], mail.to
    assert_equal ["aminauzayisenga@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end

  test "password_reset" do
    mail = UserMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["auzayisenga@akilahinstitute.org"], mail.to
    assert_equal ["aminauzayisenga@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
