Feature: Activity Log
  As a user, I want to view my activity log,
  so I can track my recent actions like creating, updating, and deleting Kanban tasks.

  Background:
    Given the user is logged into the platform
    And the user is on their profile page

  # Normal Flow
  Scenario: Successfully view activity log
    When the user clicks on the "Activity Log" tab
    Then the system should display the user's recent activities
    And the user should see a list of Kanban tasks created, updated, and deleted

  # Alternate Flow: Filter activity log by task interactions
  Scenario: Filter activity log by created Kanban tasks
    When the user selects "Created tasks" from the filter options
    Then the system should display only the user's created Kanban tasks
    And the user should see all tasks they have created

  # Alternate Flow: Filter activity log by updated Kanban tasks
  Scenario: Filter activity log by updated tasks
    When the user selects "Updated tasks" from the filter options
    Then the system should display only the user's updated Kanban tasks
    And the user should see all tasks they have modified

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
