Feature: Create review
  As an avid moviegoer
  So I can share my wisdom with others
  I want to review a movie.

Background: movies and reviews have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | The Terminator          | R      | 26-Oct-1984  |

  And the following moviegoers exist:
  | name  |
  | Alice |

Scenario: Create review
  Given I am on the details page for "The Terminator"
  And I am logged in as "Alice"
  When I follow "Add review"
  And I select "3" from "How many potatoes:"
  And I fill in "Comments" with "Interesting but violent"
  And I press "Create Review"
  Then I should be on the details page for "The Terminator"
  And I should see Alice's review with 3 potatoes

Scenario: Create review (sad path - not logged in)
  Given I am on the details page for "The Terminator"
  And I am not logged in
  When I follow "Add review"
  Then I should be on the Twitter Authorization page
