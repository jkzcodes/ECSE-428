Feature: Activity Log
  As a user, I want to view my activity log,
  so I can track my recent actions like posts, likes, and comments.

  Background:
    Given the user is logged into the platform
    And the user is on their profile page

  # Normal Flow
  Scenario: Successfully view activity log
    When the user clicks on the "Activity Log" tab
    Then the system should display the user's recent activities
    And the user should see a list of posts, likes, and comments

  # Alternate Flow: Filter activity log by type
  Scenario: Filter activity log by post interactions
    When the user selects "Posts" from the filter options
    Then the system should display only the user's post activities
    And the user should see all posts they have created

  # Alternate Flow: Filter activity log by comments
  Scenario: Filter activity log by comments
    When the user selects "Comments" from the filter options
    Then the system should display only the user's comment activities
    And the user should see all comments they have made

  # Error Flow: Activity log fails to load due to network issue
  Scenario: Activity log fails to load due to network connection issue
    When the user clicks on the "Activity Log" tab
    And there is a network connection issue
    Then the system should display an error message: "Unable to load activity log. Please check your connection and try again."
    And the user should remain on their profile page

  # Error Flow: No activity recorded
  Scenario: User has no recorded activity
    Given the user has not engaged in any activities
    When the user clicks on the "Activity Log" tab
    Then the system should display a message: "No activity recorded."
    And the user should be able to return to their profile page
