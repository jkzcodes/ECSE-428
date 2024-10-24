Feature: Account Customization
  As a user, I want to customize my account settings,
  so I can personalize my experience on the platform.

  Background:
    Given the user is logged into their account
    And the user is on the account settings page

  # Normal Flow
  Scenario: Successfully update account information
    When the user updates their email, username, or password
    And the user clicks the "Save Changes" button
    Then the system should save the updated account information
    And the user should see a confirmation message that their account has been updated

  # Alternate Flow: Change password
  Scenario: Successfully change account password
    When the user enters the current password and a new password
    And the user clicks the "Save Changes" button
    Then the system should update the account password
    And the user should see a confirmation message that the password has been changed

  # Alternate Flow: Enable two-factor authentication (2FA)
  Scenario: Successfully enable two-factor authentication
    When the user selects the option to enable two-factor authentication
    And the user sets up the 2FA method (email or phone)
    And the user clicks "Enable"
    Then the system should activate two-factor authentication
    And the user should see a confirmation message that 2FA has been enabled

  # Error Flow: Failed password change due to incorrect current password
  Scenario: Password change fails due to incorrect current password
    When the user enters an incorrect current password
    And the user clicks "Save Changes"
    Then the system should display an error message: "Current password is incorrect."
    And the password should not be changed

  # Error Flow: Failed 2FA setup due to invalid input
  Scenario: Two-factor authentication setup fails due to invalid phone number
    When the user enters an invalid phone number for two-factor authentication
    And the user clicks "Enable"
    Then the system should display an error message: "Invalid phone number entered."
    And 2FA should not be enabled

  # Error Flow: Account customization fails due to network issue
  Scenario: Account customization fails due to network connection issue
    When the user clicks "Save Changes" after updating account information
    And there is a network connection issue
    Then the system should display an error message: "Unable to save changes. Please check your connection and try again."
    And the account information should remain unchanged
