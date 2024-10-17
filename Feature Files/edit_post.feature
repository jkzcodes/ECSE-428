Feature: Edit Post
    As a registered user, 
    I want to edit my post, 
    Such that the updates can be seen by other users.

    Background:
        Given the user is logged into their account
        And the user has an existing post

    # Normal Flow: Edit a post successfully
    Scenario: The user edits their post successfully
        When the user navigates to their post
        And the user clicks the edit button
        And the user updates the post content
        And the user clicks the save button
        Then the post should be updated with the new content
        And the updates should be visible to other users

    # Alternate Flow: Cancel editing a post
    Scenario: The user cancels editing their post
        When the user navigates to their post
        And the user clicks the edit button
        And the user updates the post content
        And the user clicks the cancel button
        Then the post should remain unchanged
        And the original content should be visible to other users

    # Error Flow: Edit a post with invalid content
    Scenario: The user tries to edit their post with invalid content
        When the user navigates to their post
        And the user clicks the edit button
        And the user updates the post content with invalid data
        And the user clicks the save button
        Then an error message should be displayed
        And the post should remain unchanged
        And the original content should be visible to other users

    # Error Flow: User not logged in tries to edit a post
    Scenario: The user is not logged in and tries to edit a post
        Given the user is not logged into their account
        When the user navigates to a post
        And the user clicks the edit button
        Then the user should be redirected to the login page
        And the post should remain unchanged
        And the original content should be visible to other users