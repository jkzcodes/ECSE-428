Feature: Task Scheduling
  As a user, I want to schedule my tasks,
  so I can automatically publish them at a later time.

  Background:
    Given the user is logged into the platform
    And the user is on the task creation page

  # Normal Flow
  Scenario: Successfully schedule a task
    When the user creates a task and selects the "Schedule" option
    And the user selects a future date and time for the task
    And the user clicks "Save"
    Then the system should schedule the task for the selected date and time
    And the user should see a confirmation message that the task has been scheduled
    And the task should appear in the user's scheduled tasks section

  # Alternate Flow: Edit a scheduled task
  Scenario: Successfully edit a scheduled task
    Given the user has a scheduled task
    When the user navigates to the scheduled tasks section
    And the user selects the task to edit
    Then the user should be able to modify the task content and schedule
    And the user should save the changes successfully

  # Alternate Flow: Cancel a scheduled task
  Scenario: Successfully cancel a scheduled task
    Given the user has a scheduled task
    When the user navigates to the scheduled tasks section
    And the user clicks the "Cancel" button for the scheduled task
    Then the system should remove the task from the scheduled tasks
    And the user should see a confirmation message that the scheduled task has been canceled


  # Error Flow: Schedule a task in the past
  Scenario: User attempts to schedule a task for a past time
    When the user selects a date and time in the past for scheduling
    Then the system should display an error message: "You cannot schedule a task for a time in the past."
    And the task should not be scheduled
