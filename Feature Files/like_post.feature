Feature: Like a post
    As a registered user,
    I want to like a post,
    Such that other users can see how many likes a post has.

    # Normal Flow: User likes a post successfully
    Scenario: User likes a post successfully
        Given the user is logged in
        And the user is viewing a post
        When the user clicks the "Like" button
        Then the post's like count should increase by one
        And the user should see the updated like count

    # Error Flow: User tries to like a post without being logged in
    Scenario: User tries to like a post without being logged in
        Given the user is not logged in
        When the user clicks the "Like" button
        Then the user should be prompted to log in
        And the post's like count should not change

    # Alternate Flow: User unlikes a post
    Scenario: User likes a post they have already liked
        Given the user is logged in
        And the user has already liked the post
        When the user clicks the "Like" button again
        Then the post's like count should decrease by one
        And the user should see the updated like count