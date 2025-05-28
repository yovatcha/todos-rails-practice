Feature: Quest Management
  As a user
  I want to view and delete quests
  So that I can manage my quest list

  Background:
    Given I am on the homepage

  Scenario: View quest details
    Given I have a quest named "Test Quest"
    When I click the view button for quest "Test Quest"
    Then I should be redirected to the quest details page
    And I should see quest information

  Scenario: Delete quest successfully
    Given I have a quest named "Quest to Delete"
    When I click the delete button for quest "Quest to Delete"
    Then I should not see "Quest to Delete"

  Scenario: View button navigates to correct quest
    Given I have a quest named "My Test Quest"
    When I click the view button for quest "My Test Quest"
    Then I should be on the quest details page
    And the page URL should contain "/quests/"

  Scenario: No quests available
    Given I have no quests
    When I am on the homepage
    Then I should see "No quests found"
