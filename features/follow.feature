@javascript
Feature: Follow
  
  Scenario: Follow a user
    Given there are multiple users
    And a user logs on
    When the user visits another users page
    And presses the "Follow" button
    Then the user should see the "Unfollow" button
    And the other user should have the current user as a follower
    And the current user should have the other user in their following
    
  Scenario: Unfollow a user
    Given there are multiple users
    And a user logs on
    And the user is already following the other user
    When the user visits another users page
    And presses the "Unfollow" button
    Then the user should see the "Follow" button
    And the other user should not have the current user as a follower
    And the current user should not have the other user in their following