Feature: Automated Moderation Tools for Recipes and Comments

  The application shall include automated moderation tools that review and flag inappropriate or duplicate recipes and
  comments, ensuring a positive and safe community experience by preventing the spread of harmful or redundant content.

  Background:
    Given the application includes automated moderation tools
    And the user is logged into the platform

  Scenario: Automatically flag inappropriate recipes
    Given a user posts a recipe with inappropriate content
    When the moderation tool reviews the recipe
    Then the system should automatically flag the recipe for inappropriate content
    And the recipe should be marked for review by an admin
    And the user should receive a notification that their recipe has been flagged

  Scenario: Automatically flag duplicate recipes
    Given a user posts a recipe that already exists on the platform
    When the moderation tool detects a duplicate recipe
    Then the system should automatically flag the recipe as a duplicate
    And the user should receive a notification that their recipe has been flagged as a duplicate

  Scenario: Automatically flag inappropriate comments
    Given a user posts an inappropriate comment on a recipe
    When the moderation tool reviews the comment
    Then the system should automatically flag the comment for inappropriate content
    And the comment should be marked for review by an admin
    And the user should receive a notification that their comment has been flagged

  Scenario: Automatically flag duplicate comments
    Given a user posts a duplicate comment on a recipe
    When the moderation tool detects the duplicate comment
    Then the system should automatically flag the comment as a duplicate
    And the user should receive a notification that their comment has been flagged as a duplicate

  Scenario: Admin reviews flagged content
    Given the system has flagged content (recipes or comments) for review
    When an admin reviews the flagged content
    Then the admin should see details of the flagged content, including the reason for flagging
    And the admin should be able to approve or remove the flagged content