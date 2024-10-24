Feature: Update Account Information
  As a registered user,
  I want to update my account information,
  So that other users can see the updated information.

  # Normal Flow
  Scenario: Successfully update account information
    Given the user is a registered user
    And the user is logged into their account
    When the user navigates to the account settings page
    And the user updates their account information with valid data
    And the user saves the changes
    Then the user should see a confirmation message
    And other users should see the updated information

  # Error Flow: Invalid Data
  Scenario: Update account information with invalid data
    Given the user is a registered user
    And the user is logged into their account
    When the user navigates to the account settings page
    And the user updates their account information with invalid data
    And the user attempts to save the changes
    Then the user should see an error message
    And their account information should not be updated

  # Alternate Flow: Partial updates to account information
  Scenario: Successfully update only some account information
    Given the user is a registered user
    And the user is logged into their account
    When the user navigates to the account settings page
    And the user updates only some fields (e.g., phone number or email address)
    And the user saves the changes
    Then the user should see a confirmation message
    And only the updated fields should be changed in the system

  # Error Flow: No changes made
  Scenario: Attempt to save without making any changes
    Given the user is a registered user
    And the user is logged into their account
    When the user navigates to the account settings page
    And the user attempts to save without making any changes
    Then the system should display a message indicating "No changes made"
    And the account information should remain unchanged