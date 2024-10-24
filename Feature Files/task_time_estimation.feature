Feature: Task Time Estimation and Tracking
  As a user, I want to estimate and track time spent on tasks,
  so I can better manage my workload and measure productivity.

  Background:
    Given the user is logged into the platform
    And the user is on their Kanban board

  # Normal Flow
  Scenario: Successfully estimate time for a task
    When the user creates or edits a task
    And the user enters an estimated time for completion in hours
    And the user clicks the "Save" button
    Then the system should save the time estimate for the task
    And the estimated time should be displayed on the task card

  # Alternate Flow: Start tracking time on a task
  Scenario: Successfully start tracking time on a task
    Given the user is viewing a task
    When the user clicks the "Start Timer" button
    Then the system should start tracking the time spent on the task
    And the user should see the active timer on the task card

  # Alternate Flow: Pause or stop tracking time on a task
  Scenario: Successfully pause or stop time tracking on a task
    Given the user is currently tracking time on a task
    When the user clicks the "Pause" or "Stop Timer" button
    Then the system should pause or stop tracking the time spent
    And the total time tracked should be displayed on the task card

  # Error Flow: Time estimation fails due to invalid input
  Scenario: Time estimation fails due to invalid input
    When the user enters a non-numeric or negative value for the estimated time
    Then the system should display an error message: "Please enter a valid time estimate."
    And the task should not save until a valid estimate is entered

  # Error Flow: Time tracking fails due to network issue
  Scenario: Time tracking fails due to network connection issue
    When the user clicks the "Start Timer" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to start the timer. Please check your connection and try again."
