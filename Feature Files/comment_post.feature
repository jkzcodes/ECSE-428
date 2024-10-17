Feature: Comment on a post
    As a registered user, 
    I want to comment on a post, 
    Such that other users can see my comment.

    # Normal Flow: User comments on a post successfully
    Scenario: User successfully comments on a post
        Given the user is logged in
        And the user is viewing a post
        When the user enters a comment in the comment box
        And the user clicks the "Post Comment" button
        Then the comment should be visible under the post
        And other users should be able to see the comment

    # Error Flow: User tries to comment without being logged in
    Scenario: User tries to comment on a post without being logged in
        Given the user is not logged in
        When the user tries to enter a comment in the comment box
        Then the user should be prompted to log in
        And the comment should not be posted

    # Error Flow: User tries to post an empty comment
    Scenario: User tries to post an empty comment
        Given the user is logged in
        And the user is viewing a post
        When the user clicks the "Post Comment" button without entering a comment
        Then an error message should be displayed indicating that the comment cannot be empty
        And the comment should not be posted