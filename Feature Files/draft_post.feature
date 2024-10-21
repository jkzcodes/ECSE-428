Feature: Draft Post
  As a user, I want to save my post as a draft,
  so I can come back later to edit and publish it when I’m ready.

  Background:
    Given the user is logged into the platform
    And the user is on the post creation page

  # Normal Flow
  Scenario: Successfully save a post as a draft
    When the user clicks the "Save as Draft" button
    Then the system should save the post as a draft
    And the user should see a confirmation message that the draft has been saved
    And the draft should be accessible in the user's drafts section

  # Alternate Flow: Edit draft post
  Scenario: Successfully edit a saved draft post
    Given the user has a draft post saved
    When the user navigates to the drafts section
    And the user selects the draft post to edit
    Then the user should be able to make changes to the draft
    And the user should be able to save the changes

  # Alternate Flow: Publish draft post
  Scenario: Successfully publish a draft post
    Given the user has a draft post saved
    When the user selects the draft post
    And the user clicks the "Publish" button
    Then the system should publish the post
    And the user should see a confirmation message that the post has been published
    And the post should appear in the user's feed

  # Error Flow: Draft save fails due to network issue
  Scenario: Draft save fails due to network connection issue
    When the user clicks the "Save as Draft" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to save the draft. Please check your connection and try again."
    And the post content should remain on the page

  # Error Flow: Draft save fails due to empty content
  Scenario: User attempts to save an empty draft post
    When the user tries to save a draft without any content
    Then the system should display an error message: "Cannot save an empty draft."
    And the draft should not be saved
