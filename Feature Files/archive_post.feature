Feature: Archive Post
    As a registered user, 
    I want to archive one of my posts, 
    Such that they cannot be seen by other users.

    Background:
        Given the user is logged into their account
        And the user has at least one post

    # Normal Flow: Archive a post successfully
    Scenario: User archives a post
        When the user navigates to their profile
        And the user selects a post to archive
        And the user clicks the "Archive" button
        Then the post should be archived
        And the post should no longer be visible to other users

    # Error Flow: Attempt to archive a post that is already archived
    Scenario: User tries to archive an already archived post
        Given the user has already archived the post
        When the user navigates to their profile
        And the user selects the archived post
        And the user clicks the "Archive" button
        Then the system should display a message "This post is already archived"