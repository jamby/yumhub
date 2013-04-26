@javascript
Feature: Posting

  Scenario: Successful post
    Given a user logs on
    And the user is now on the home page
    When the user fills in "Name" with "Peking Duck"
    And the user selects "Dinner" for "Category"
    And the user fills in "Description" with "This is a famous duck dish from Beijing that has been prepared since the imperial era, and is now considered a national dish of China."
    And the user fills in "Ingredients" with "1 Duck\n5 cups Maltose\n2cups of Hoisin sauce"
    And the user fills in "Steps" with "1. Rinse duck\n2. Dry duck\n3. Glaze duck\n4. Bake in oven for 4 hours"
    And the user submits the post
    Then the user should see "Peking Duck" in the main feed
    And the user should see their username in the main feed
    And the user should see "This is a famous duck dish from Beijing that has been prepared since the imperial era, and is now considered a national dish of China." in the main feed
    And the user should see "Nom Created" as a flash
  
  Scenario: Unsuccessful post with some values
    Given a user logs on
    And the user is now on the home page
    When the user fills in "Name" with "Dan Dan Noodles"
    And the user selects "Lunch" for "Category"
    And the user fills in "Steps" with "1. Get noodles\n2. Cook noodles.\n3. Eat noodles."
    And the user submits the post
    Then the user should see "can't be blank" as a flash
    
  Scenario: Unsuccessful post with no values
    Given a user logs on
    And the user is now on the home page
    When the user submits the post
    Then the user should see "can't be blank" as a flash