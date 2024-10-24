Feature: Add Users to Project Team
  As a project manager, I want to add users to my project team,
  so I can collaborate and assign tasks efficiently.

  Background:
    Given the project manager is logged into the system
    And the project manager is viewing the project page for a specific Kanban board

  # Normal Flow
  Scenario: Successfully send a team invite
    When the project manager clicks on the "Add User to Team" button
    Then the system should send an invitation to the selected user
    And the project manager should see a confirmation that the invitation has been sent
    And the project manager should be able to view the status of the invitation

  # Alternate Flow: Team invitation already sent
  Scenario: Try to add a user who already has a pending team invitation
    Given the project manager has already sent an invitation to the same user
    When the project manager clicks on the "Add User to Team" button again
    Then the system should display a message indicating that a team invitation is already pending
    And no duplicate invitation should be sent
    And the "Add User to Team" button should be replaced with an option to "Cancel Invitation"

  # Alternate Flow: Accept a team invitation
  Scenario: Accept a pending team invitation
    Given the user has received a team invitation from the project manager
    When the user clicks on the "Accept" button for the team invitation
    Then the system should confirm that the team invitation has been accepted
    And the user should be added to the project team
    And the project manager should see the new user on the Kanban board's team list

  # Error Flow: Team invitation fails due to network connection issue
  Scenario: Invitation fails due to network connection issue
    When the project manager clicks on the "Add User to Team" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to send team invitation. Please check your internet connection and try again."
    And the project manager should remain on the same page with the "Add User to Team" button still available

  # Error Flow: Team invitation fails due to maximum number of team members reached
  Scenario: Invitation fails due to reaching the maximum number of team members
    Given the project has reached the maximum allowed number of team members
    When the project manager tries to add another user
    Then the system should display an error message: "You have reached the maximum number of team members. Remove a team member to add more users."
    And the project manager should remain on the same page with the option to manage the team members
