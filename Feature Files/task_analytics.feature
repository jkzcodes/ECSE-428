Feature: Task Analytics
  As a user, I want to view analytics for my tasks,
  so I can understand their performance and engagement.

  Background:
    Given the user is logged into the platform
    And the user has created at least one task

  # Normal Flow
  Scenario: Successfully view task analytics
    When the user navigates to the analytics section of a task
    Then the system should display the task's analytics, including views, likes, and comments
    And the user should see a graphical representation of the task's performance over time

  # Alternate Flow: Filter analytics by date range
  Scenario: Filter task analytics by date range
    When the user selects a custom date range for the analytics
    Then the system should display the task's analytics for the selected date range
    And the user should see updated graphs and metrics

  # Alternate Flow: Compare analytics between multiple tasks
  Scenario: Compare analytics between multiple tasks
    When the user selects multiple tasks for comparison
    Then the system should display a comparison of analytics for the selected tasks
    And the user should see a side-by-side comparison of views, likes, and comments


  # Error Flow: task has no analytics available
  Scenario: task has no analytics available
    Given the user has a new task that has not received any engagement
    When the user navigates to the analytics section of that task
    Then the system should display a message: "No analytics available for this task yet."
    And the user should see a suggestion to promote the task for better engagement
