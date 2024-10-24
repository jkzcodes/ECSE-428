Feature: Bookmark Kanban Item
  As a user, I want to bookmark Kanban items,
  so I can easily save and access specific tasks or cards for later review.

  Background:
    Given the user is logged into the platform
    And the user is viewing a Kanban item

  # Normal Flow
  Scenario: Successfully bookmark a Kanban item
    When the user clicks the "Bookmark" button on a Kanban item
    Then the system should save the item to the user's bookmarks
    And the user should see a confirmation message that the Kanban item has been bookmarked
    And the Kanban item should appear in the user's bookmarked items section

  # Alternate Flow: Remove bookmark from Kanban item
  Scenario: Successfully remove a bookmarked Kanban item
    Given the user has already bookmarked the Kanban item
    When the user clicks the "Remove Bookmark" button
    Then the system should remove the Kanban item from the user's bookmarks
    And the user should see a confirmation message that the bookmark has been removed

  # Error Flow: Bookmark fails due to network issue
  Scenario: Bookmark Kanban item fails due to network connection issue
    When the user clicks the "Bookmark" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to bookmark the Kanban item. Please check your connection and try again."
    And the item should not be saved to the user's bookmarks

  # Error Flow: Bookmark fails due to Kanban item being deleted
  Scenario: User tries to bookmark a deleted Kanban item
    When the user clicks the "Bookmark" button
    And the Kanban item has already been deleted
    Then the system should display an error message: "This Kanban item has been deleted and cannot be bookmarked."
    And no bookmark should be saved
