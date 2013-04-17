Feature: Signup

  Scenario: Unsuccessful signup
    Given a user visits the signup page
    When he submits invalid user information
    Then he should see a signup error message
  
  Scenario: Successful signup
    Given a user visits the signup page
    When the user submits valid user information
    Then he should see the main page
    And he should see a Logout link