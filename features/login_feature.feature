Feature: Login Feature
  User authorization 

  Scenario: User sees the login form
    When I go to the login page
    Then I should see find some login form with elements
  Scenario: users login with invalid email or password
    When Email is wrong
    Then I should see the email is wrong message
    When Password is wrong
    Then I should see the password is wrong message
  Scenario: users login with valid email or password
    When Email and password is correct
    Then I should see the login successfull message