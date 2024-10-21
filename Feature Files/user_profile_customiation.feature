Feature: User Profile Customization
  As a user, I want to customize my profile,
  so I can express my personality and preferences to others.

  Background:
    Given the user is logged into the platform
    And the user is on their profile settings page

  # Normal Flow
  Scenario: Successfully update profile information
    When the user updates their profile picture, bio, and other details
    And the user clicks the "Save Changes" button
    Then the system should save the updated profile information
    And the user should see a confirmation message that their profile has been updated

  # Alternate Flow: Change profile picture
  Scenario: Successfully change profile picture
    When the user selects a new profile picture
    And the user clicks the "Save Changes" button
    Then the system should update the profile picture
    And the user should see a confirmation message that the profile picture has been updated

  # Alternate Flow: Remove profile picture
  Scenario: Successfully remove the profile picture
    Given the user has a profile picture
    When the user selects the option to remove the profile picture
    And the user clicks the "Save Changes" button
    Then the system should remove the profile picture
    And the user should see a confirmation message that the profile picture has been removed

  # Error Flow: Customization fails due to network issue
  Scenario: Profile customization fails due to network connection issue
    When the user clicks "Save Changes" after making updates
    And there is a network connection issue
    Then the system should display an error message: "Unable to save changes. Please check your connection and try again."
    And the user's profile information should remain unchanged

  # Error Flow: Profile update fails due to invalid input
  Scenario: User attempts to save invalid profile information
    When the user enters invalid information in the bio field
    Then the system should display an error message: "Bio must be between 1 and 150 characters."
    And the user's profile information should remain unchanged
