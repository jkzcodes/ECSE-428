Feature: Automated Moderation Tools for Tasks and Comments
  The project coordination system shall include automated moderation tools that review and flag inappropriate or duplicate tasks and comments, ensuring a productive and respectful workspace by preventing the spread of harmful or redundant content.

  Background:
    Given the project coordination system includes automated moderation tools
    And the user is logged into the platform

  # Normal Flow: Automatically flag inappropriate tasks
  Scenario: Automatically flag inappropriate tasks
    Given a user creates a task with inappropriate content
    When the moderation tool reviews the task
    Then the system should automatically flag the task for inappropriate content
    And the task should be marked for review by an admin
    And the user should receive a notification that their task has been flagged

  # Normal Flow: Automatically flag duplicate tasks
  Scenario: Automatically flag duplicate tasks
    Given a user creates a task that already exists in the project
    When the moderation tool detects a duplicate task
    Then the system should automatically flag the task as a duplicate
    And the user should receive a notification that their task has been flagged as a duplicate

  # Normal Flow: Automatically flag inappropriate comments
  Scenario: Automatically flag inappropriate comments
    Given a user posts an inappropriate comment on a task
    When the moderation tool reviews the comment
    Then the system should automatically flag the comment for inappropriate content
    And the comment should be marked for review by an admin
    And the user should receive a notification that their comment has been flagged

  # Normal Flow: Automatically flag duplicate comments
  Scenario: Automatically flag duplicate comments
    Given a user posts a duplicate comment on a task
    When the moderation tool detects the duplicate comment
    Then the system should automatically flag the comment as a duplicate
    And the user should receive a notification that their comment has been flagged as a duplicate

  # Normal Flow: Admin reviews flagged content
  Scenario: Admin reviews flagged content
    Given the system has flagged content (tasks or comments) for review
    When an admin reviews the flagged content
    Then the admin should see details of the flagged content, including the reason for flagging
    And the admin should be able to approve or remove the flagged content
