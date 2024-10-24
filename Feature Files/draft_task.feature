Feature: Draft Kanban task
  As a user, I want to save my Kanban task as a draft,
  so I can come back later to edit and publish it when I’m ready.

  Background:
    Given the user is logged into the platform
    And the user is on the Kanban task creation page

  # Normal Flow
  Scenario: Successfully save a Kanban task as a draft
    When the user clicks the "Save as Draft" button
    Then the system should save the Kanban task as a draft
    And the user should see a confirmation message that the draft has been saved
    And the draft should be accessible in the user's drafts section

  # Alternate Flow: Edit draft Kanban task
  Scenario: Successfully edit a saved draft Kanban task
    Given the user has a draft Kanban task saved
    When the user navigates to the drafts section
    And the user selects the draft Kanban task to edit
    Then the user should be able to make changes to the draft
    And the user should be able to save the changes

  # Alternate Flow: Publish draft Kanban task
  Scenario: Successfully publish a draft Kanban task
    Given the user has a draft Kanban task saved
    When the user selects the draft Kanban task
    And the user clicks the "Publish" button
    Then the system should publish the Kanban task
    And the user should see a confirmation message that the Kanban task has been published
    And the Kanban task should appear in the user's board

  # Error Flow: Draft save fails due to network issue
  Scenario: Draft save fails due to network connection issue
    When the user clicks the "Save as Draft" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to save the draft. Please check your connection and try again."
    And the Kanban task content should remain on the page

  # Error Flow: Draft save fails due to empty content
  Scenario: User attempts to save an empty draft Kanban task
    When the user tries to save a draft without any content
    Then the system should display an error message: "Cannot save an empty draft."
    And the draft should not be saved
