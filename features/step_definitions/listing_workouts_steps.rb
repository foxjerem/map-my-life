Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^no workouts have been added$/) do
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I click "(.*?)"$/) do |object|
  click_on object
end

When(/^I fill in the workout details$/) do
  fill_in 'Activity', with: 'Running'
  fill_in 'Date', with: '5/10/2014'
  fill_in 'Duration', with: 60
  fill_in 'Intensity', with: 'high'
end

Then(/^I should see my workout listed$/) do
  expect(page).to have_content('Running')
  expect(page).to have_content('5/10/2014')
  expect(page).to have_content('60')
  expect(page).to have_content('high')
end

When(/^I update the workout details$/) do
  fill_in 'Activity', with: 'Hiking'
end

Then(/^I should see the updated details listed$/) do
  expect(page).to have_content('Hiking')
  expect(page).not_to have_content('Running')
end

Given(/^I have added a workout$/) do
  FactoryGirl.create(:workout)
end

Given(/^I added an incorrect workout$/) do
  FactoryGirl.create(:workout, activity: 'Swimming')
end

Then(/^the workout should be removed$/) do
  expect(page).not_to have_content('Swimming')
end

Given(/^I create an invalid workout$/) do
  visit '/'
  click_on 'New Workout'
  fill_in 'Activity', with: 'Running'
  fill_in 'Date', with: ''
  fill_in 'Duration', with: 60
  fill_in 'Intensity', with: 'high'
end

Then(/^I should see an error message$/) do
  expect(page).to have_content('Error: a workout must have a date')
end

Then(/^the workout should not be saved$/) do
  expect(page).not_to have_content('Boxing')
end