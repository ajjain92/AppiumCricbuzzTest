Given(/^I am on Cricbuzz Home Page$/) do
  visit "https://www.cricbuzz.com"
end

When(/^I click on Rankings button$/) do
  find(:css, '.td-head[href*="iccrankings"]').click
end

When(/^I click on All Rounders button$/) do
  find(:css, '.cb-list-item[href*="allrounders"]').click
end

Then(/^I should get the respective rankings$/) do
  ex_op="Ashwin"
  ac_op=find(:css, '.cbz-ui-align-left[href*="ashwin"]').text
expect(ac_op).to eql(ex_op.to_s)
end