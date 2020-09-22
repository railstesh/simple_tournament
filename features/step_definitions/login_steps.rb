When(/^I go to the login page$/) do
  visit new_user_session_path
end

Then(/^I should see find some login form with elements$/) do
  expect(page).to have_content('Login')
  expect(page).to have_field('user[email]')
  expect(page).to have_field('user[password]')
  expect(page).to have_selector('input[type=submit]')
end

When(/^Email is wrong$/) do
  create(:user)
  visit new_user_session_path
end

Then(/^I should see the email is wrong message$/) do
  fill_in 'user[email]', with: 'wrong@test.com'
  fill_in 'user[password]', with: '123456'
  find('input[name="commit"]').click

  expect(page).to have_content('Invalid Email or password.')
end

When(/^Password is wrong$/) do
  @user = create(:user)
  visit new_user_session_path
end

Then(/^I should see the password is wrong message$/) do
  fill_in 'user[email]', with: @user.email
  fill_in 'user[password]', with: 'wrong'
  find('input[name="commit"]').click

  expect(page).to have_content('Invalid Email or password.')
end

When(/^Email and password is correct$/) do
  @user = create(:user)
  visit new_user_session_path
end

Then(/^I should see the login successfull message$/) do
  fill_in 'user[email]', with: @user.email
  fill_in 'user[password]', with: 'password-123'
  find('input[name="commit"]').click

  expect(page).to have_content('Signed in successfully.')
end
