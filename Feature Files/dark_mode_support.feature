Feature: Toggle Display Mode for Kanban Board
  As a user, I want to toggle between light and dark modes for the Kanban board,
  so I can choose the display setting that is easier on my eyes.

  Background:
    Given the user is logged into the platform
    And the user is on the settings page

  # Normal Flow
  Scenario: Successfully enable dark mode for Kanban board
    When the user selects the dark mode option
    And the user saves the settings
    Then the system should apply dark mode across the Kanban board interface
    And the user should see the Kanban board in dark mode

  # Alternate Flow: Switch back to light mode for Kanban board
  Scenario: User switches from dark mode to light mode for Kanban board
    Given the user has dark mode enabled
    When the user selects the light mode option
    And the user saves the settings
    Then the system should switch back to light mode for the Kanban board
    And the user should see the interface in light mode

  # Error Flow: Unsupported device
  Scenario: User tries to enable dark mode on an unsupported device
    When the user selects dark mode on a device that does not support it
    Then the system should display an error message: "Dark mode is not supported on this device."
    And the system should revert to the default light mode
