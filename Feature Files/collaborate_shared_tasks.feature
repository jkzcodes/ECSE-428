Feature: Collaborate to Co-create and Complete a Shared Task
  As a project manager or team member, I want to collaborate with other users to co-create and complete a shared task, so we can work together efficiently.

  Background:
    Given the user is logged into the platform
    And the user has initiated a new task collaboration with a verified team member

  # Normal Flow
  Scenario: Successfully collaborate with another user to create and complete a shared task
    When the user invites a collaborator to co-create a task
    And the collaborator accepts the invitation
    Then both users should be able to contribute to the task
    And both users should be able to edit task details and subtasks
    And the system should allow both users to mark the task as complete once finished

  # Alternate Flow: Collaborator declines the invitation
  Scenario: Collaborator declines the task collaboration invitation
    When the user invites a collaborator to co-create a task
    And the collaborator declines the invitation
    Then the system should notify the user that the invitation was declined
    And the user should be given the option to invite another collaborator or proceed alone

  # Alternate Flow: Remove collaborator from the task
  Scenario: Remove a collaborator from the task collaboration
    Given the user is collaborating on a task with a collaborator
    When the user removes the collaborator from the task
    Then the system should notify the collaborator that they have been removed
    And the user should regain full control over the task without further input from "<collaborator>"

  # Error Flow: Collaborator unable to edit task due to insufficient permissions
  Scenario: Collaborator is unable to edit shared task due to insufficient permissions
    Given the user has invited a collaborator to co-create a task
    When the collaborator tries to edit the task
    And they do not have the correct permissions
    Then the system should display a message: "You do not have permission to edit this task."
    And the system should log the issue for review by the task owner
