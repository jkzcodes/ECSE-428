Feature: Pin tasks
  As a user, I want to pin my tasks,
  so I can highlight important content at the top of my profile or feed.

  Background:
    Given the user is logged into the platform
    And the user has at least one task available

  # Normal Flow
  Scenario: Successfully pin a task
    When the user selects a task to pin
    And the user clicks the "Pin task" button
    Then the system should pin the selected task to the top of the profile or feed
    And the user should see a confirmation message that the task has been pinned

  # Alternate Flow: Unpin a pinned task
  Scenario: Successfully unpin a pinned task
    Given the user has a pinned task
    When the user clicks the "Unpin task" button on the pinned task
    Then the system should unpin the task from the top
    And the user should see a confirmation message that the task has been unpinned

  # Alternate Flow: Pin multiple tasks
  Scenario: Successfully pin multiple tasks
    When the user selects multiple tasks to pin
    And the user clicks the "Pin tasks" button
    Then the system should pin all selected tasks to the top of the profile or feed
    And the user should see a confirmation message that the tasks have been pinned

  # Error Flow: Pin fails due to network issue
  Scenario: Pin fails due to network connection issue
    When the user clicks the "Pin task" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to pin the task. Please check your connection and try again."
    And the task should remain unpinned

  # Error Flow: User attempts to pin more tasks than allowed
  Scenario: User attempts to pin more tasks than the limit
    Given the user has already pinned the maximum number of tasks allowed
    When the user tries to pin another task
    Then the system should display an error message: "You have reached the maximum number of pinned tasks. Unpin a task to pin a new one."
    And the task should not be pinned
