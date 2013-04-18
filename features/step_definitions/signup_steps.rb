Given(/^a user visits the signup page$/) do
  visit new_user_registration_path
end

When(/^he submits invalid user information$/) do
  click_button "Sign up"
end

Then(/^he should see a signup error message$/) do
  page.has_content?('div.alert.alert-error')
  page.has_content?('div.error_explanation')
end

When(/^the user submits valid user information$/) do
  within('#signup') do
    fill_in "user[username]", with: "testuser"
    fill_in "user[email]", with: "testuser@gmail.com"
    fill_in "user[password]", with: "test123"
    fill_in "user[password_confirmation]", with: "test123"
  end
end

Then(/^he should see the main page$/) do
  page.has_content?(text: "Lorem ipsum dolor sit amet")
end