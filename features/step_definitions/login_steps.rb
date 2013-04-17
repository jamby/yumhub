Given(/^a user visits the login page$/) do
  visit user_session_path
end

When(/^he submits invalid login information$/) do
  click_button "Sign in"
end

Then(/^he should see a login error message$/) do
  page.has_content?('div.alert.alert-error')
  page.has_content?('div.error_explanation')
  page.has_content?(text: 'Invalid login or password.')
end

Given(/^the user has an account$/) do
  @user = User.create(username: 'testuser', email: 'testuser@gmail.com', password: 'test123', password_confirmation: 'test123')
end

When(/^the user submits valid login username$/) do
  fill_in "Password", with: @user.username
end

When(/^the user submits valid login email$/) do
  fill_in "Password", with: @user.email
end

When(/^the user submits valid login password$/) do
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then(/^he should see his profile page$/) do
  page.has_content?(text: @user.username)
  page.has_content?(text: @user.email)
end

Then(/^he should see a Logout link$/) do
  page.has_link?('Logout', href: destroy_user_session_path)
end