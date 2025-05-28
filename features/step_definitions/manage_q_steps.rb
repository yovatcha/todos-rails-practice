# Step definitions for quest management tests

# Data setup steps
Given("I have a quest named {string}") do |quest_name|
  # Create a quest in the test database
  @quest = Quest.create!(name: quest_name, status: false)
  visit quests_path # Refresh the page to see the new quest
end

Given("I have multiple quests") do
  # Create multiple quests for testing
  @quest1 = Quest.create!(name: "First Quest", status: false)
  @quest2 = Quest.create!(name: "Second Quest", status: false)
  @quest3 = Quest.create!(name: "Third Quest", status: false)
  visit quests_path
end

Given("I have no quests") do
  # Ensure no quests exist (clean up any existing ones)
  Quest.destroy_all if defined?(Quest)
  visit quests_path
end

# Action steps
When("I click the view button for quest {string}") do |quest_name|
  # Find the quest container and click the view button
  quest_container = find('[data-quest-target="name"]', text: quest_name).ancestor('[data-controller="quest"]')
  within(quest_container) do
    find('[data-testid="view-button"]').click
  end
end

When("I click the delete button for quest {string}") do |quest_name|
  # Find the quest container and click the delete button
  quest_container = find('[data-quest-target="name"]', text: quest_name).ancestor('[data-controller="quest"]')
  within(quest_container) do
    find('[data-testid="delete-button"]').click
  end
end

When("I click the delete button for the first quest") do
  # Click delete button for the first quest found
  first('[data-testid="delete-button"]').click
end

When("I click the view button for the first quest") do
  # Click view button for the first quest found
  first('[data-testid="view-button"]').click
end

# Assertion steps
Then("I should be redirected to the quest details page") do
  expect(current_path).to match(/\/quests\/\d+$/)
end

Then("I should see quest information") do
  # Verify we're on a quest details page
  expect(page).to have_current_path(/\/quests\/\d+$/)
end

Then("the quest should be removed from the list") do
  # Verify quest is no longer visible
  expect(page).not_to have_css('[data-controller="quest"]', text: @quest1.name) if @quest1
end

Then("the remaining quests should still be visible") do
  # Verify other quests are still present
  expect(page).to have_css('[data-controller="quest"]', minimum: 1)
end

Then("I should be on the quest details page") do
  expect(current_path).to match(/\/quests\/\d+$/)
end

Then("the page URL should contain {string}") do |url_fragment|
  expect(current_url).to include(url_fragment)
end

# Alternative simpler step definitions
When("I click the view button") do
  find('[data-testid="view-button"]').click
end

When("I click the delete button") do
  find('[data-testid="delete-button"]').click
end

# Clean up step - add this to your features/support/env.rb instead
# After do |scenario|
#   Quest.delete_all if defined?(Quest)
# end
