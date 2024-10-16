Feature: Collaborate to Co-create and Post a Shared Recipe
  As a user, I want to collaborate with other users to co-create and post a shared recipe,
  so we can work together on ideas.

  Background:
    Given the user is logged into the platform
    And the user has initiated a new recipe collaboration with a verified user


  # Normal Flow
  Scenario: Successfully collaborate with another user to create a shared recipe
    When the user invites a collaborator to co-create a recipe
    And the collaborator accepts the invitation
    Then both users should be able to contribute to the recipe
    And both users should be able to edit ingredients and instructions
    And the system should allow both users to post the shared recipe


  # Alternate Flow: Collaborator declines the invitation
  Scenario: Collaborator declines the recipe collaboration invitation
    When the user invites a collaborator to co-create a recipe
    And the collaborator declines the invitation
    Then the system should notify the user that the invitation was declined
    And the user should be given the option to invite another collaborator or proceed alone


  # Alternate Flow: Remove collaborator from the recipe
  Scenario: Remove a collaborator from the recipe collaboration
    Given the user is collaborating on a recipe with a collaborator
    When the user removes a collaborator from the collaboration
    Then the system should notify the collaborator that they have been removed
    And the user should regain full control over the recipe without further input from "<collaborator>"


  # Error Flow: Collaborator unable to edit recipe due to insufficient permissions
  Scenario: Collaborator is unable to edit shared recipe due to insufficient permissions
    Given the user has invited a collaborator to co-create a recipe
    When the collaborator tries to edit the recipe
    And they do not have the correct permissions
    Then the system should display a message: "You do not have permission to edit this recipe."
    And the system should log the issue for review by the owner
