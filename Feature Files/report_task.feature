Feature: Report Kanban task
  As a user, I want to report inappropriate or erroneous Kanban tasks,
  so the platform can take action to review or remove tasks that violate the guidelines.

  Background:
    Given the user is logged into the platform
    And the user is viewing a Kanban task they believe violates the guidelines

  # Normal Flow
  Scenario: Successfully report a Kanban task
    When the user clicks on the "Report task" button
    And the user selects a reason for reporting the task
    Then the system should send the report for review
    And the user should see a confirmation message that the task has been reported

  # Alternate Flow: Report Kanban task without selecting a reason
  Scenario: User attempts to report an task without selecting a reason
    When the user clicks the "Report task" button
    And the user does not select a reason for reporting
    Then the system should display an error message: "Please select a reason to report the task."
    And the report should not be submitted

  # Alternate Flow: task already reported
  Scenario: User tries to report a Kanban task they have already reported
    Given the user has previously reported the same Kanban task
    When the user clicks on the "Report task" button again
    Then the system should display a message indicating the task has already been reported
    And no duplicate report should be sent

  # Error Flow: Reporting fails due to network issue
  Scenario: Reporting fails due to network connection issue
    When the user clicks "Report task"
    And there is a network connection issue
    Then the system should display an error message: "Unable to report the task. Please check your connection and try again."
    And the user should remain on the Kanban board

  # Error Flow: Reporting fails due to task being removed
  Scenario: User tries to report a Kanban task that has already been removed
    When the user clicks the "Report task" button
    And the task has been removed by the time the report is processed
    Then the system should display a message: "This task has already been removed."
    And no report should be submitted
