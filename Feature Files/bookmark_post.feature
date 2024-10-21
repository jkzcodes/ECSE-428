Feature: Bookmark Post
  As a user, I want to bookmark posts,
  so I can easily save and access content for later.

  Background:
    Given the user is logged into the platform
    And the user is viewing a post

  # Normal Flow
  Scenario: Successfully bookmark a post
    When the user clicks the "Bookmark" button on a post
    Then the system should save the post to the user's bookmarks
    And the user should see a confirmation message that the post has been bookmarked
    And the post should appear in the user's bookmarked posts section

  # Alternate Flow: Remove bookmark from post
  Scenario: Successfully remove a bookmarked post
    Given the user has already bookmarked the post
    When the user clicks the "Remove Bookmark" button
    Then the system should remove the post from the user's bookmarks
    And the user should see a confirmation message that the bookmark has been removed

  # Error Flow: Bookmark fails due to network issue
  Scenario: Bookmark fails due to network connection issue
    When the user clicks the "Bookmark" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to bookmark the post. Please check your connection and try again."
    And the post should not be saved to the user's bookmarks

  # Error Flow: Bookmark fails due to post being deleted
  Scenario: User tries to bookmark a deleted post
    When the user clicks the "Bookmark" button
    And the post has already been deleted
    Then the system should display an error message: "This post has been deleted and cannot be bookmarked."
    And no bookmark should be saved
