Feature: Notification Preferences for Kanban Updates
  As a user, I want to customize my notification preferences,
  so I can control which notifications I receive about Kanban updates and how.

  Background:
    Given the user is logged into the platform
    And the user is on the notification settings page

  # Normal Flow
  Scenario: Successfully update notification preferences
    When the user selects notification preferences
    And the user saves the settings
    Then the system should apply the preferences
    And the user should receive notifications based on the selected options

  # Alternate Flow: Disable all notifications
  Scenario: User disables all notifications
    When the user deselects all notification options
    And the user saves the settings
    Then the system should not send any notifications to the user
    And the system should confirm that notifications are turned off

  # Alternate Flow: Reset to default settings
  Scenario: User resets notification preferences to default
    When the user clicks on the "Reset to Default" button
    Then the system should revert the notification settings to the default options
    And the user should be able to receive notifications according to the default settings


  # Error Flow: Invalid notification settings
  Scenario: User tries to enable unsupported notification method
    When the user selects a notification method that is not supported (e.g., SMS in a region without support)
    Then the system should display an error message: "This notification method is not supported in your region."
    And the setting should not be saved
