require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    check "Activated" if @user.activated
    fill_in "Clearance", with: @user.clearance
    fill_in "Email", with: @user.email
    fill_in "Hashed password", with: @user.hashed_password
    fill_in "Ip address", with: @user.ip_address
    fill_in "Login", with: @user.login
    fill_in "Name", with: @user.name
    fill_in "Salt", with: @user.salt
    fill_in "Surname", with: @user.surname
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    check "Activated" if @user.activated
    fill_in "Clearance", with: @user.clearance
    fill_in "Email", with: @user.email
    fill_in "Hashed password", with: @user.hashed_password
    fill_in "Ip address", with: @user.ip_address
    fill_in "Login", with: @user.login
    fill_in "Name", with: @user.name
    fill_in "Salt", with: @user.salt
    fill_in "Surname", with: @user.surname
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end