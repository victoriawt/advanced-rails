Feature: Create, read, update, and delete movies
 
  As an avid moviegoer
  So that I can share my knowledge about movies
  I want to create, read, update, and delete movies.

Background: there is a movie in the database
  Given the following movies exist:$
  | title                   | rating | release_date |
  | Test Movie              | G      | 01-Dec-2000  |
  And I am on the RottenPotatoes home page

Scenario: Create a movie (happy path)
  When I follow "Add new movie"
  And I fill in "Title" with "My Movie"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  And I should see "My Movie"

Scenario: Read a movie (happy path)
  When I follow "More about Test Movie"
  Then I should be on the details page for "Test Movie"
  And I should see "Description"

Scenario: Update a movie (happy path)
  Given I am on the details page for "Test Movie"
  When I follow "Edit"
  And I fill in "Title" with "This is Not a Test Movie"
  And I press "Update Movie Info"
  Then I should be on the details page for "This is Not a Test Movie"

Scenario: Delete a movie (happy path)
  Given I am on the details page for "Test Movie"
  When I press "Delete"
  #Need javascript support to finish testing this scenario!
  And I confirm the popup
  When I should be on the RottenPotatoes home page
  And I should not see "Test Movie"
