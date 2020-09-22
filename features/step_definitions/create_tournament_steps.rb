When(/^I go to create page with user role$/) do
  user = create(:user)

  visit new_user_session_path
  visit new_user_session_path
  fill_in 'user[email]', with: user.email
  fill_in 'user[password]', with: 'password-123'
  find('input[name="commit"]').click

  visit new_tournament_path
end

Then(/^I should see the unauthorized message$/) do
  expect(page).to have_content('You are not authorized to access this page.')
end

When(/^I go to create page with role admin$/) do
  user = create(:user)
  user.roles << create(:role, :admin)

  visit new_user_session_path
  visit new_user_session_path
  fill_in 'user[email]', with: user.email
  fill_in 'user[password]', with: 'password-123'
  find('input[name="commit"]').click

  visit new_tournament_path
end

Then(/^I should see the create form$/) do
  expect(page).to have_content('New Tournament')
  expect(page).to have_no_content('You are not authorized to access this page.')
end

When(/^I fill and submit form$/) do
  user = create(:user)
  user.roles << create(:role, :admin)

  visit new_user_session_path
  visit new_user_session_path
  fill_in 'user[email]', with: user.email
  fill_in 'user[password]', with: 'password-123'
  find('input[name="commit"]').click

  visit new_tournament_path
  fill_in 'tournament[name]', with: 'first-tournament'
  find('input[name="commit"]').click
end

Then(/^I should see successfully create message$/) do
  expect(page).to have_content('Tournament was successfully created.')
end
