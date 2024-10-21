Feature: Dark Mode Support
  As a user, I want to toggle between light and dark modes,
  so I can choose the display setting that is easier on my eyes.

  Background:
    Given the user is logged into the platform
    And the user is on the settings page

  # Normal Flow
  Scenario: Successfully enable dark mode
    When the user selects the dark mode option
    And the user saves the settings
    Then the system should apply dark mode across the platform
    And the user should see the interface in dark mode

  # Alternate Flow: Switch back to light mode
  Scenario: User switches from dark mode to light mode
    Given the user has dark mode enabled
    When the user selects the light mode option
    And the user saves the settings
    Then the system should switch back to light mode
    And the user should see the interface in light mode

  # Error Flow: Theme switch fails due to network issue
  Scenario: Theme switch fails due to network connection issue
    When the user clicks "Save" after selecting dark mode
    And there is a network connection issue
    Then the system should display an error message: "Unable to change display settings. Please check your connection and try again."
    And the user should remain on the settings page with their original theme selection intact

  # Error Flow: Unsupported device
  Scenario: User tries to enable dark mode on an unsupported device
    When the user selects dark mode on a device that does not support it
    Then the system should display an error message: "Dark mode is not supported on this device."
    And the system should revert to the default light mode
