Feature: Login
  
  Scenario: Unsuccessful login
    Given a user visits the login page
    When he submits invalid login information
    Then he should see a login error message
    
  Scenario: Successful login with username
    Given a user visits the login page
    And the user has an account
    When the user submits valid login username
    And the user submits valid login password
    Then he should see his profile page
    And he should see a Logout link
    
  Scenario: Successful login with email
    Given a user visits the login page
    And the user has an account
    When the user submits valid login email
    And the user submits valid login password
    Then he should see his profile page
    And he should see a Logout link