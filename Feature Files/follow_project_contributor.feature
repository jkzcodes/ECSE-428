Feature: Follow Popular Project Contributors
  As a project manager or team member, I want to follow popular project contributors, so I can easily find their updates and stay informed about their new tasks or ideas.

  Background:
    Given the user is logged into the platform
    And the user is on the profile page of a popular project contributor

  # Normal Flow
  Scenario: Successfully follow a project contributor
    When the user clicks on the "Follow" button
    Then the user should see a confirmation that they are now following the contributor
    And the contributor’s tasks and updates should be added to the user’s project feed
    And the user should receive notifications about new tasks or updates from the contributor

  # Alternate Flow: Already following the contributor
  Scenario: Try to follow a contributor the user is already following
    Given the user is already following the contributor
    When the user clicks on the "Follow" button again
    Then the system should display a message indicating that the user is already following the contributor
    And no duplicate follow action should be performed
    And the "Follow" button should be replaced with an "Unfollow" option

  # Alternate Flow: Unfollow a popular project contributor
  Scenario: Unfollow a popular project contributor
    Given the user is following the contributor
    When the user clicks on the "Unfollow" button
    Then the user should see a confirmation that they have unfollowed the contributor
    And the contributor’s tasks and updates should be removed from the user’s feed
    And the user should stop receiving notifications about new tasks or updates from the contributor

  # Error Flow: Follow fails due to network connection issue
  Scenario: Follow fails due to network connection issue
    When the user clicks on the "Follow" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to follow. Please check your internet connection and try again."
    And the user should remain on the same page with the "Follow" button still available

  # Error Flow: Follow fails due to reaching the maximum number of contributors
  Scenario: Follow fails due to reaching the maximum number of contributors
    Given the user has reached the maximum allowed number of follows
    When the user tries to follow another contributor
    Then the system should display an error message: "You have reached the maximum number of contributors you can follow. Unfollow someone to follow more contributors."
    And the user should remain on the same page with the option to manage their follows
