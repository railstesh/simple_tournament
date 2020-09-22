Feature: Signup Feature
  User can be signup only with valid form data and get validation message with invalid data.

  Scenario: User sees the signup form
    When I go to the signup page
    Then I should see find signup form with elements
  
  Scenario: User signup successfully
    When Fill form with valid values
    Then I should see the welcome message
  
  Scenario: User signup unsuccessfully
    When Email format is wrong
    Then I should see the email faild validation message
    When Password is not present
    Then I should see the password validation message
  