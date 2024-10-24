Feature: Bookmark Kanban task
  As a user, I want to bookmark Kanban tasks,
  so I can easily save and access specific tasks or cards for later review.

  Background:
    Given the user is logged into the platform
    And the user is viewing a Kanban task

  # Normal Flow
  Scenario: Successfully bookmark a Kanban task
    When the user clicks the "Bookmark" button on a Kanban task
    Then the system should save the task to the user's bookmarks
    And the user should see a confirmation message that the Kanban task has been bookmarked
    And the Kanban task should appear in the user's bookmarked tasks section

  # Alternate Flow: Remove bookmark from Kanban task
  Scenario: Successfully remove a bookmarked Kanban task
    Given the user has already bookmarked the Kanban task
    When the user clicks the "Remove Bookmark" button
    Then the system should remove the Kanban task from the user's bookmarks
    And the user should see a confirmation message that the bookmark has been removed

  # Error Flow: Bookmark fails due to network issue
  Scenario: Bookmark Kanban task fails due to network connection issue
    When the user clicks the "Bookmark" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to bookmark the Kanban task. Please check your connection and try again."
    And the task should not be saved to the user's bookmarks

  # Error Flow: Bookmark fails due to Kanban task being deleted
  Scenario: User tries to bookmark a deleted Kanban task
    When the user clicks the "Bookmark" button
    And the Kanban task has already been deleted
    Then the system should display an error message: "This Kanban task has been deleted and cannot be bookmarked."
    And no bookmark should be saved
