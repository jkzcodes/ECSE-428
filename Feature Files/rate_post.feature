Feature: Rate a post
    As a registered user, 
    I want to rate a post out of 5 stars, 
    Such that an average rating can be shown to other users.

    # Normal Flow: rate a post with 5 stars
    Scenario: User rates a post with 5 stars
        Given the user is logged in
        And the user is viewing a post
        When the user selects 5 stars
        Then the post should be rated with 5 stars
        And the average rating should be updated

    # Alternate Flow: rate a post with 3 stars
    Scenario: User rates a post with 3 stars
        Given the user is logged in
        And the user is viewing a post
        When the user selects 3 stars
        Then the post should be rated with 3 stars
        And the average rating should be updated

    # Error Flow: rate a post without being logged in
    Scenario: User tries to rate a post without being logged in
        Given the user is not logged in
        When the user tries to rate a post
        Then the user should be prompted to log in
        And the post should not be rated