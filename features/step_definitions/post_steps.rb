Given(/^a user logs on$/) do
  visit root_path
  @user = User.create(username: 'testuser', email: 'testuser@gmail.com', password: 'test123', password_confirmation: 'test123')
  fill_in "user[login]", with: @user.username
  within('#login') do
    fill_in "user[password]", with: @user.password
  end
  click_button "Sign in"
end

Given(/^the user is now on the home page$/) do
  page.current_path == root_path
end

When(/^the user fills in "(.+)" with "(.+)"$/) do |field, user_created|
  fill_in "nom[#{field.downcase}]", with: user_created
end

When(/^the user selects "(.+)" for "(.+)"$/) do |user_created, field|
  select user_created, from: "nom[#{field.downcase}]"
end

When(/^the user submits the post$/) do
  click_button "Post"
end

Then(/^the user should see "(.+)" in the main feed$/) do |user_created|
  within('.nom_feed') do
    page.has_content?(user_created)
  end
end

Then(/^the user should see their username in the main feed$/) do
  within('.nom_feed') do
    page.has_content?(@user.username)
  end
end

Then(/^the user should see "(.+)" as a flash$/) do |flashed|
  page.has_content?('div.alert')
  page.has_content?("Nom created!")
end