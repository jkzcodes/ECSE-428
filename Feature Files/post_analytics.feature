Feature: Post Analytics
  As a user, I want to view analytics for my posts,
  so I can understand their performance and engagement.

  Background:
    Given the user is logged into the platform
    And the user has created at least one post

  # Normal Flow
  Scenario: Successfully view post analytics
    When the user navigates to the analytics section of a post
    Then the system should display the post's analytics, including views, likes, and comments
    And the user should see a graphical representation of the post's performance over time

  # Alternate Flow: Filter analytics by date range
  Scenario: Filter post analytics by date range
    When the user selects a custom date range for the analytics
    Then the system should display the post's analytics for the selected date range
    And the user should see updated graphs and metrics

  # Alternate Flow: Compare analytics between multiple posts
  Scenario: Compare analytics between multiple posts
    When the user selects multiple posts for comparison
    Then the system should display a comparison of analytics for the selected posts
    And the user should see a side-by-side comparison of views, likes, and comments

  # Error Flow: Analytics fails to load due to network issue
  Scenario: Analytics fails to load due to network connection issue
    When the user navigates to the analytics section of a post
    And there is a network connection issue
    Then the system should display an error message: "Unable to load post analytics. Please check your connection and try again."
    And the user should remain on the analytics page

  # Error Flow: Post has no analytics available
  Scenario: Post has no analytics available
    Given the user has a new post that has not received any engagement
    When the user navigates to the analytics section of that post
    Then the system should display a message: "No analytics available for this post yet."
    And the user should see a suggestion to promote the post for better engagement
