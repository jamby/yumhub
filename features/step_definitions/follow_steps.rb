Given(/^there are multiple users$/) do
  @user2 = User.create(username: 'testuser2', email: 'testuser2@gmail.com', password: 'test123', password_confirmation: 'test123')
end

When(/^the user visits another users page$/) do
  visit user_path(@user2.slug)
end

When(/^presses the "(.*?)" button$/) do |arg1|
  click_button arg1
end

Then(/^the user should see the "(.*?)" button$/) do |arg1|
  page.has_content?(arg1)
end

Then(/^the other user should have the current user as a follower$/) do
  visit followers_user_path(@user2.slug)
  page.has_content?(@user.username)
end

Then(/^the current user should have the other user in their following$/) do
  visit following_user_path(@user.username)
  page.has_content?(@user2.username)
end

Given(/^the user is already following the other user$/) do
  @user.follow(@user2)
end

Then(/^the other user should not have the current user as a follower$/) do
  visit followers_user_path(@user2.slug)
  page.has_content?(@user.username) == false
end

Then(/^the current user should not have the other user in their following$/) do
  visit following_user_path(@user.username)
  page.has_content?(@user2.username) == false
end
