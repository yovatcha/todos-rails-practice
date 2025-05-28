Given("I am on the homepage") do
  visit quests_path
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I press {string}") do |button|
  click_button button
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should not see {string}") do |text|
  expect(page).not_to have_content(text)
end

When("I click the element with test ID {string}") do |testid|
  find("[data-testid='#{testid}']", match: :first).click
end
