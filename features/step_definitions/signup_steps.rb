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
  fill_in "Username", with: "testuser"
  fill_in "Email", with: "testuser@gmail.com"
  fill_in "Password", with: "test123"
  fill_in "Password confirmation", with: "test123"
end

Then(/^he should see the main page$/) do
  page.has_content?(text: "Lorem ipsum dolor sit amet")
end