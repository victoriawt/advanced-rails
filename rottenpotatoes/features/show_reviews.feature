Feature: See reviews
  As an avid moviegoer
  So I can learn others' opinions
  I want to see movie reviews

Background: movies and reviews have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |

  And the following moviegoers exist:
  | name  |
  | Alice |
  | Bob   |

  And the following reviews exist:
  | movie                   | moviegoer | potatoes | comments                  |
  | Aladdin                 | Alice     | 5        | Hilarious                 |
  | Aladdin                 | Bob       | 1        | Full of racist stereotypes|

  And I am logged in as "Alice"

Scenario: Read reviews
  When I go to the details page for "Aladdin"
  Then I should see Alice's review with 5 potatoes
  And I should see Bob's review with 1 potato
