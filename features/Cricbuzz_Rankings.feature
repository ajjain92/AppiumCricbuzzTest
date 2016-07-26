Feature: As a user I want to check the rankings of Cricket All-Rounders

  Scenario: User checks the Cricketer Ranking
	Given I am on Cricbuzz Home Page
	When I click on Rankings button
        And I click on All Rounders button
        Then I should get the respective rankings
    
    
