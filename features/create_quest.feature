Feature: Creating a new quest
  As a user
  I want to add a new quest
  So that I can track my progress

  Scenario: User adds a quest from the homepage
    Given I am on the homepage
    When I fill in "New quest..." with "Learn Cucumber"
    And I press "Add"
    Then I should see "Learn Cucumber"
