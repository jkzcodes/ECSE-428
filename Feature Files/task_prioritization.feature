Feature: Task Priority  
  As a user, I want to set priority levels for tasks,  
  so I can organize and focus on the most important tasks.

  Background:  
    Given the user is logged into the platform  
    And the user is on the task creation or edit page

  # Normal Flow
  Scenario: Successfully set a task priority  
    When the user creates or edits a task  
    And the user selects a priority level from "Low", "Medium", or "High"  
    And the user clicks the "Save" button  
    Then the system should save the task with the selected priority  
    And the user should see the task displayed with the selected priority label

  # Alternate Flow: Change priority of an existing task  
  Scenario: Successfully change task priority  
    Given the user has a task with an assigned priority  
    When the user edits the task  
    And the user selects a different priority level  
    And the user clicks the "Save" button  
    Then the system should update the task with the new priority  
    And the user should see the task with the updated priority label

  # Error Flow: Priority save fails due to network issue  
  Scenario: Task priority fails to save due to network connection issue  
    When the user clicks "Save" after selecting a priority level  
    And there is a network connection issue  
    Then the system should display an error message: "Unable to save priority. Please check your connection and try again."  
    And the task should retain its previous priority level

  # Error Flow: Priority not selected  
  Scenario: User attempts to save a task without selecting a priority  
    When the user creates or edits a task  
    And the user does not select any priority level  
    Then the system should assign a default priority of "Medium"  
    And the user should see the task with the "Medium" priority label
