Feature: Tournament create feature
  Only admin have access to create tournament 

  Scenario: User see the unauthorized message without role admin
    When I go to create page with user role
    Then I should see the unauthorized message

  Scenario: User see the create form with admin user
    When I go to create page with role admin
    Then I should see the create form

  Scenario: Admin create tournament successfully
    When I fill and submit form
    Then I should see successfully create message


  