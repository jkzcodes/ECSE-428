Feature: Create Account
    As an unregistered user,
    I want to create an account,
    So that others can see my account.

    # Normal Flow
    Scenario: Successful account creation
        Given the user is an unregistered user
        When the user provides valid registration details
        And the user submits the registration form
        Then the user account should be created
        And others should be able to see the user account

    # Error Flow: Missing Details
    Scenario: Account creation with missing details
        Given the user is an unregistered user
        When the user provides incomplete registration details
        And the user submits the registration form
        Then the user should see an error message
        And their account should not be created

    # Error Flow: Existing Email
    Scenario: Account creation with already registered email
        Given the user is an unregistered user
        And the user provide an email that is already registered
        When the user submit the registration form
        Then the user should see an error message
        And my account should not be created