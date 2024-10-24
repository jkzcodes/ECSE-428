Feature: Task Dependencies  
  As a user, I want to set task dependencies,  
  so I can ensure that certain tasks are completed before others can begin.

  Background:  
    Given the user is logged into the platform  
    And the user is on the task creation or edit page

  # Normal Flow  
  Scenario: Successfully set a task dependency  
    When the user creates or edits a task  
    And the user selects another task as a dependency  
    And the user clicks the "Save" button  
    Then the system should save the task with the selected dependency  
    And the dependent task should be marked as "Blocked" until the prerequisite task is completed

  # Alternate Flow: Complete a prerequisite task  
  Scenario: Successfully complete a prerequisite task  
    Given a task has been marked as dependent on another task  
    And the prerequisite task is marked as "Completed"  
    Then the dependent task should be marked as "Unblocked"  
    And the user should be able to start working on the dependent task

  # Alternate Flow: Remove a task dependency  
  Scenario: Successfully remove a task dependency  
    Given the user has set a task dependency  
    When the user edits the dependent task  
    And the user removes the task dependency  
    And the user clicks the "Save" button  
    Then the system should update the task to remove the dependency  
    And the task should no longer be marked as "Blocked"


  # Error Flow: Dependent task attempted to start before prerequisite completion  
  Scenario: User attempts to start a dependent task before completing prerequisite  
    Given a task is dependent on another task  
    When the user tries to start the dependent task  
    And the prerequisite task has not been completed  
    Then the system should display an error message: "This task is blocked by an incomplete prerequisite."  
    And the user should not be able to start the dependent task
