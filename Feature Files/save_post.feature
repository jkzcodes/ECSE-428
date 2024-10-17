Feature: Save a post to the cookbook

    As a registered user, I want to save a post to my “cookbook“, such that I can see it in the “cookbook” tab.

    # Normal Flow: Save a post to the cookbook
    Scenario: User saves a post to the cookbook
        Given the user is logged in
        And the user is viewing a post
        When the user clicks the "Save to Cookbook" button
        Then the post should be saved to the user's cookbook
        And the post should be visible in the "cookbook" tab

    # Alternate Flow: Save a post that is already in the cookbook
    Scenario: User tries to save a post that is already in the cookbook
        Given the user is logged in
        And the user is viewing a post that is already saved in the cookbook
        When the user clicks the "Save to Cookbook" button
        Then the user should see a message indicating the post is already saved
        And the post should remain in the user's cookbook

    # Error Flow: Save a post without being logged in
    Scenario: User tries to save a post without being logged in
        Given the user is not logged in
        And the user is viewing a post
        When the user clicks the "Save to Cookbook" button
        Then the user should be prompted to log in
        And the post should not be saved to the cookbook