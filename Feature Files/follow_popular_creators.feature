Feature: Follow Popular Salad Dressing Creators
  As a user, I want to follow popular salad dressing creators,
  so I can easily find their content and stay updated on their new recipes.

  Background:
    Given the user is logged into the platform
    And the user is on the profile page of a popular salad dressing creator

  # Normal Flow
  Scenario: Successfully follow a creator
    When the user clicks on the "Follow" button
    Then the user should see a confirmation that they are now following the creator
    And the creator’s content should be added to the user’s feed
    And the user should receive notifications about new recipes from the creator

  # Alternate Flow: Already following the creator
  Scenario: Try to follow a creator the user is already following
    Given the user is already following the creator
    When the user clicks on the "Follow" button again
    Then the system should display a message indicating that the user is already following the creator
    And no duplicate follow action should be performed
    And the "Follow" button should be replaced with an "Unfollow" option

  # Alternate Flow: Unfollow the creator
  Scenario: Unfollow a popular salad dressing creator
    Given the user is following the creator
    When the user clicks on the "Unfollow" button
    Then the user should see a confirmation that they have unfollowed the creator
    And the creator’s content should be removed from the user’s feed
    And the user should stop receiving notifications about new recipes from the creator

  # Error Flow: Follow fails due to network connection issue
  Scenario: Follow fails due to network connection issue
    When the user clicks on the "Follow" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to follow. Please check your internet connection and try again."
    And the user should remain on the same page with the "Follow" button still available

  # Error Flow: Follow fails due to reaching the maximum number of creators
  Scenario: Follow fails due to reaching the maximum number of creators
    Given the user has reached the maximum allowed number of follows
    When the user tries to follow another creator
    Then the system should display an error message: "You have reached the maximum number of creators you can follow. Unfollow someone to follow more creators."
    And the user should remain on the same page with the option to manage their follows