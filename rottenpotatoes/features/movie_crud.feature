Feature: Create, read, update, and delete movies
 
  As an avid moviegoer
  So that I can share my knowledge about movies
  I want to create, read, update, and delete movies.

Background: 
  Given I am on the RottenPotatoes home page

Scenario: Create a movie (happy path)
  When I follow "Add new movie"
  And I fill in "Title" with "My Movie"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  And I should see "My Movie"

Scenario: Read a movie (happy path)

Scenario: Update a movie (happy path)

Scenario: Delete a movie (happy path)

