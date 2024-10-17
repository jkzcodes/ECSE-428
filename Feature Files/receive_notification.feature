Feature: Receive notifications for interactions on posts
    As a registered user,
    I want to receive a notification when someone likes, comments, or rates one of my posts,
    Such that it can be displayed in my “notifications” tab.

    # Normal Flow: Receive a notification when someone likes a post
    Scenario: User receives a notification when their post is liked
        Given the user is logged into their account
        And the user has a post
        When another user likes the post
        Then the user should receive a notification
        And the notification should be displayed in the “notifications” tab

    # Normal Flow: Receive a notification when someone comments on a post
    Scenario: User receives a notification when their post is commented on
        Given the user is logged into their account
        And the user has a post
        When another user comments on the post
        Then the user should receive a notification
        And the notification should be displayed in the “notifications” tab

    # Normal Flow: Receive a notification when someone rates a post
    Scenario: User receives a notification when their post is rated
        Given the user is logged into their account
        And the user has a post
        When another user rates the post
        Then the user should receive a notification
        And the notification should be displayed in the “notifications” tab

    # Alternate Flow: User does not receive duplicate notifications for the same interaction
    Scenario: User does not receive duplicate notifications for the same like
        Given the user is logged into their account
        And the user has a post
        When another user likes the post
        And the same user unlikes the post,
        And the same user likes the post again,
        Then the user should receive only one notification
        And the notification should be displayed in the “notifications” tab

    # Error Flow: Unregistered user does not receive a notification if they are not logged in
    Scenario: Unregistered user does not receive a notification when not logged in
        Given the user is not logged into their account
        When the user tries to access to notifications tab
        Then the user is prompted to log in
        And no notifications should be displayed in the “notifications” tab