Feature: Recurring Tasks  
  As a user, I want to set tasks as recurring,  
  so I can automate the creation of tasks that need to be done regularly.

  Background:  
    Given the user is logged into the platform  
    And the user is on the task creation or edit page

  # Normal Flow  
  Scenario: Successfully set a recurring task  
    When the user creates or edits a task  
    And the user selects the "Set as Recurring" option  
    And the user chooses a recurrence frequency (e.g., daily, weekly, monthly)  
    And the user clicks the "Save" button  
    Then the system should save the task with the selected recurrence schedule  
    And the task should automatically reappear in the user's task list based on the chosen frequency


  # Alternate Flow: Modify the recurrence schedule of an existing task  
  Scenario: Successfully update a task's recurrence schedule  
    Given the user has set a recurring task  
    When the user edits the task  
    And the user changes the recurrence frequency  
    And the user clicks the "Save" button  
    Then the system should update the task with the new recurrence schedule  
    And the new schedule should apply going forward

  # Alternate Flow: Cancel a recurring task  
  Scenario: Successfully cancel a recurring task  
    Given the user has set a task to recur  
    When the user edits the task  
    And the user selects the option to cancel the recurrence  
    And the user clicks the "Save" button  
    Then the system should remove the recurrence from the task  
    And the task should no longer automatically reappear after completion


  # Error Flow: Attempt to set an invalid recurrence frequency  
  Scenario: User attempts to set an invalid recurrence frequency  
    When the user selects an invalid recurrence frequency (e.g., 0 days)  
    And the user clicks the "Save" button  
    Then the system should display an error message: "Invalid recurrence frequency. Please select a valid interval."  
    And the recurrence should not be saved
