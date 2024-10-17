Feature: Delete Post
    As a registered user, 
    I want to delete one of my posts, 
    Such that it is no longer accessible by anyone.

    Background:
        Given the user is logged into their account
        And the user has at least one post

    # Normal Flow: delete a post successfully
    Scenario: User deletes a post successfully
        When the user navigates to their post
        And the user clicks on the delete button
        And the user confirms the delete action
        Then the post should be removed from their profile
        And the post should no longer be accessible by anyone

    # Alternate Flow: cancel delete post action
    Scenario: User cancels the delete post action
        When the user navigates to their post
        And the user clicks on the delete button
        And the user confirms the cancel action
        Then the post should remain on their profile
        And the post should still be accessible by anyone