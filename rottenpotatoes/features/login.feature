Feature: Log in to site
  As an avid moviegoer
  So that I can add movies and reviews
  I want to log in to RottenPotatoes.

Background: Given I am on the RottenPotatoes home page

Scenario: Not logged in
  Given I am not logged in
  When I go to the RottenPotatoes home page
  Then I should see "Log in with your Twitter account"

Scenario: Logged in
  Given I am logged in as "Alice"
  When I go to the RottenPotatoes home page
  Then I should see "Welcome, Alice!"
  And I should see "Log Out"
