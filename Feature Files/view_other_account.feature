Feature: View another user's account
    As a user,
    I want to view the account of another user,
    So that I can see the projects they’re a part of.

    # Normal Flow: View another user's account
    Scenario: Successfully view another user's account
        Given the user is logged in
        When the user navigates to the "Search User" page
        And the user enters the username "<username>"
        And the user clicks the "Search" button
        Then the user's account page should be displayed
        And the projects the user is a part of should be visible

        Examples:
            | username       |
            | john_doe       |
            | jane_smith     |
            | alice_johnson  |

    # Alternate Flow: User not found
    Scenario: Search for a non-existent user
        Given the user is logged in
        When the user navigates to the "Search User" page
        And the user enters the username "<username>"
        And the user clicks the "Search" button
        Then an error message should be displayed indicating that the user was not found

        Examples:
            | username       |
            | non_existent   |
            | unknown_user   |

    # Error Flow: Missing username
    Scenario: Search with missing username
        Given the user is logged in
        When the user navigates to the "Search User" page
        And the user leaves the username field blank
        And the user clicks the "Search" button
        Then an error message should be displayed indicating that the username is required