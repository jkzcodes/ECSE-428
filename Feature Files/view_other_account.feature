Feature: View another user's account
    As a user,
    I want to view the account of another user,
    So that I can see their posts, their average rating, and their friends.

    # Normal Flow: User views another user's account
    Scenario: User views another user's account successfully
        Given the user is logged into the app
        When the user navigates to another user's profile
        Then the user should see the other user's posts
        And the user should see the other user's average rating
        And the user should see the other user's friends

    # Error Flow: User tries to view a non-existent account
    Scenario: User tries to view an account that does not exist
        Given the user is logged into the app
        When the user navigates to a non-existent user's profile
        Then the user should see an error message saying "User not found"

    # Error Flow: User views another user's account without being logged in
    Scenario: User views another user's account without being logged in
        Given the user is not logged into the app
        When the user tries to navigate to another user's profile
        Then the user should be prompted to log in
        And the user should not see the other user's account