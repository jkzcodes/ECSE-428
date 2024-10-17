Feature: Update Account Information
    As a registered user,
    I want to update my account information,
    So that other users can see the updated information.

    # Normal Flow
    Scenario: Successfully update account information
        Given the user is a registered user
        And the user is logged into their account
        When the user navigate to the account settings page
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

    # Error Flow: Unauthorized Access
    Scenario: Update account information without being logged in
        Given the user is a registered user
        And the user is not logged into their account
        When the user attempt to navigate to the account settings page
        Then the user should be redirected to the login page
        And the user should see a message prompting them to log in