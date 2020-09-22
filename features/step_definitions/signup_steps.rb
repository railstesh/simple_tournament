When(/^I go to the signup page$/) do
  visit new_user_registration_path
end

Then(/^I should see find signup form with elements$/) do
  expect(page).to have_content('Sign up')
  expect(page).to have_field('user[email]')
  expect(page).to have_field('user[password]')
  expect(page).to have_field('user[password_confirmation]')
  expect(page).to have_selector('input[type=submit]')
end

When(/^Fill form with valid values$/) do
  create(:role, :user)
  visit new_user_registration_path

  fill_in 'user[email]', with: 'test@test.com'
  fill_in 'user[password]', with: 'password-123'
  fill_in 'user[password_confirmation]', with: 'password-123'
  find('input[name="commit"]').click
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end

When(/^Email format is wrong$/) do
  visit new_user_registration_path

  fill_in 'user[email]', with: 'wrong@'
  fill_in 'user[password]', with: 'password'
  fill_in 'user[password_confirmation]', with: 'password'
  find('input[name="commit"]').click
end

Then(/^I should see the email faild validation message$/) do
  expect(page).to have_content('Email is invalid')
end

When(/^Password is not present$/) do
  visit new_user_registration_path

  fill_in 'user[email]', with: 'test@tution.com'
  fill_in 'user[password]', with: ''
  find('input[name="commit"]').click
end

Then(/^I should see the password validation message$/) do
  expect(page).to have_content("Password can't be blank")
end
