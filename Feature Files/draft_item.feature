Feature: Draft Kanban Item
  As a user, I want to save my Kanban item as a draft,
  so I can come back later to edit and publish it when I’m ready.

  Background:
    Given the user is logged into the platform
    And the user is on the Kanban item creation page

  # Normal Flow
  Scenario: Successfully save a Kanban item as a draft
    When the user clicks the "Save as Draft" button
    Then the system should save the Kanban item as a draft
    And the user should see a confirmation message that the draft has been saved
    And the draft should be accessible in the user's drafts section

  # Alternate Flow: Edit draft Kanban item
  Scenario: Successfully edit a saved draft Kanban item
    Given the user has a draft Kanban item saved
    When the user navigates to the drafts section
    And the user selects the draft Kanban item to edit
    Then the user should be able to make changes to the draft
    And the user should be able to save the changes

  # Alternate Flow: Publish draft Kanban item
  Scenario: Successfully publish a draft Kanban item
    Given the user has a draft Kanban item saved
    When the user selects the draft Kanban item
    And the user clicks the "Publish" button
    Then the system should publish the Kanban item
    And the user should see a confirmation message that the Kanban item has been published
    And the Kanban item should appear in the user's board

  # Error Flow: Draft save fails due to network issue
  Scenario: Draft save fails due to network connection issue
    When the user clicks the "Save as Draft" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to save the draft. Please check your connection and try again."
    And the Kanban item content should remain on the page

  # Error Flow: Draft save fails due to empty content
  Scenario: User attempts to save an empty draft Kanban item
    When the user tries to save a draft without any content
    Then the system should display an error message: "Cannot save an empty draft."
    And the draft should not be saved
