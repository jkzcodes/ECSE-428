Feature: Share post link
    As a user, 
    I want to copy the link of a post, 
    Such that I can share a post with a direct link

    # Normal Flow: Copy the link of a post
    Scenario: User copies the link of a post successfully
        Given the user is viewing a post
        When the user clicks on the "Share" button
        And the user selects the "Copy Link" option
        Then the link of the post should be copied to the user's clipboard
        And a confirmation message "Link copied to clipboard" should be displayed

    # Error Flow: Copy link fails
    Scenario: User tries to copy the link of a post but an error occurs
        Given the user is viewing a post
        When the user clicks on the "Share" button
        And the user selects the "Copy Link" option
        Then an error message "Failed to copy link. Please try again." should be displayed
        And the link should not be copied to the user's clipboard