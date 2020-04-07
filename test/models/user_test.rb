require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new( email: "nadinantire@gmail.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, 'nadinantire@gmail.com')

    
  end
  private
  def authenticated
  end
end
