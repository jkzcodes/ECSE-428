Feature: Collaborative Editing
  As a user, I want to collaboratively edit posts with other users,
  so we can work together in real-time on content creation.

  Background:
    Given the user is logged into the platform
    And the user is viewing a post that allows collaborative editing

  # Normal Flow
  Scenario: Successfully invite a user to collaborate
    When the user clicks the "Invite Collaborator" button
    And the user selects a collaborator from the user list
    Then the system should send an invitation to the selected user
    And the user should see a confirmation message that the invitation has been sent

  # Alternate Flow: Collaborator joins the editing session
  Scenario: Collaborator successfully joins the editing session
    Given a collaborator has accepted the invitation
    When the collaborator opens the post for editing
    Then the system should allow both users to edit the post simultaneously
    And changes made by each user should be reflected in real-time

  # Alternate Flow: Edit post concurrently
  Scenario: Users edit the post concurrently
    Given the user and their collaborator are both editing the post
    When one user makes a change to the post content
    Then the other user should see the change appear in their editor in real-time

  # Error Flow: Invite fails due to network issue
  Scenario: Invite to collaborate fails due to network connection issue
    When the user clicks the "Invite Collaborator" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to send invitation. Please check your connection and try again."
    And the user should remain on the editing page

  # Error Flow: Collaborator attempts to edit a locked post
  Scenario: Collaborator attempts to edit a locked post
    Given the post is locked for editing
    When the collaborator tries to access the post
    Then the system should display an error message: "This post is currently locked for editing."
    And the collaborator should not be able to make any changes
