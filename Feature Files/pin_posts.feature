Feature: Pin Posts
  As a user, I want to pin my posts,
  so I can highlight important content at the top of my profile or feed.

  Background:
    Given the user is logged into the platform
    And the user has at least one post available

  # Normal Flow
  Scenario: Successfully pin a post
    When the user selects a post to pin
    And the user clicks the "Pin Post" button
    Then the system should pin the selected post to the top of the profile or feed
    And the user should see a confirmation message that the post has been pinned

  # Alternate Flow: Unpin a pinned post
  Scenario: Successfully unpin a pinned post
    Given the user has a pinned post
    When the user clicks the "Unpin Post" button on the pinned post
    Then the system should unpin the post from the top
    And the user should see a confirmation message that the post has been unpinned

  # Alternate Flow: Pin multiple posts
  Scenario: Successfully pin multiple posts
    When the user selects multiple posts to pin
    And the user clicks the "Pin Posts" button
    Then the system should pin all selected posts to the top of the profile or feed
    And the user should see a confirmation message that the posts have been pinned

  # Error Flow: Pin fails due to network issue
  Scenario: Pin fails due to network connection issue
    When the user clicks the "Pin Post" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to pin the post. Please check your connection and try again."
    And the post should remain unpinned

  # Error Flow: User attempts to pin more posts than allowed
  Scenario: User attempts to pin more posts than the limit
    Given the user has already pinned the maximum number of posts allowed
    When the user tries to pin another post
    Then the system should display an error message: "You have reached the maximum number of pinned posts. Unpin a post to pin a new one."
    And the post should not be pinned
