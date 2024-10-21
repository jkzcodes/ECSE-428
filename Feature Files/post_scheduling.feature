Feature: Post Scheduling
  As a user, I want to schedule my posts,
  so I can automatically publish them at a later time.

  Background:
    Given the user is logged into the platform
    And the user is on the post creation page

  # Normal Flow
  Scenario: Successfully schedule a post
    When the user creates a post and selects the "Schedule" option
    And the user selects a future date and time for the post
    And the user clicks "Save"
    Then the system should schedule the post for the selected date and time
    And the user should see a confirmation message that the post has been scheduled
    And the post should appear in the user's scheduled posts section

  # Alternate Flow: Edit a scheduled post
  Scenario: Successfully edit a scheduled post
    Given the user has a scheduled post
    When the user navigates to the scheduled posts section
    And the user selects the post to edit
    Then the user should be able to modify the post content and schedule
    And the user should save the changes successfully

  # Alternate Flow: Cancel a scheduled post
  Scenario: Successfully cancel a scheduled post
    Given the user has a scheduled post
    When the user navigates to the scheduled posts section
    And the user clicks the "Cancel" button for the scheduled post
    Then the system should remove the post from the scheduled posts
    And the user should see a confirmation message that the scheduled post has been canceled

  # Error Flow: Scheduling fails due to network issue
  Scenario: Scheduling fails due to network connection issue
    When the user clicks "Schedule" after selecting the date and time
    And there is a network connection issue
    Then the system should display an error message: "Unable to schedule the post. Please check your connection and try again."
    And the post should remain in the post creation page

  # Error Flow: Schedule a post in the past
  Scenario: User attempts to schedule a post for a past time
    When the user selects a date and time in the past for scheduling
    Then the system should display an error message: "You cannot schedule a post for a time in the past."
    And the post should not be scheduled
