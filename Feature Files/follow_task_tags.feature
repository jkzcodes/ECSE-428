Feature: Follow Specific Task Tags
  As a project manager or team member, I want to follow specific task tags (e.g., #priority, #bugfix), so I can see updates and tasks related to my interests and responsibilities.

  Background:
    Given the user is logged into the platform
    And the user is viewing a task tag page they are interested in following

  # Normal Flow
  Scenario: Successfully follow a task tag
    When the user clicks on the "Follow" button for the task tag
    Then the system should confirm that the user is now following the task tag
    And the tasks and updates with that tag should appear in the user’s project feed
    And the user should receive notifications about new tasks or updates with the tag

  # Alternate Flow: Already following the task tag
  Scenario: Try to follow a task tag the user is already following
    Given the user is already following the task tag
    When the user clicks on the "Follow" button again
    Then the system should display a message indicating that the user is already following the task tag
    And no duplicate follow action should be performed
    And the "Follow" button should be replaced with an "Unfollow" option
    And the user should see an option to manage notification preferences for the tag

  # Alternate Flow: Task tag not found
  Scenario Outline: Task tag not found when attempting to follow
    Given the user is searching for a task tag
    When the user tries to follow the task tag "<task_tag>"
    Then the system should display a message indicating "Task tag not found"
    And the "Follow" button should be disabled for non-existent tags
    And the user should be prompted to search for other task tags or create their own

    Examples:
      | task_tag              |
      | #randomnonexistent    |
      | #invalidtagentry      |

  # Alternate Flow: Unfollow a task tag
  Scenario: Unfollow a task tag
    Given the user is following the task tag
    When the user clicks on the "Unfollow" button for the task tag
    Then the system should confirm that the user has unfollowed the task tag
    And the tasks and updates with that tag should be removed from the user’s project feed
    And the user should stop receiving notifications about new content with the tag

  # Error Flow: Task tag flagged for inappropriate content
  Scenario Outline: Follow task tag fails due to task tag flagged for inappropriate content
    When the user tries to follow the task tag "<flagged_task_tag>"
    Then the system should display a message: "This task tag has been flagged for inappropriate content and cannot be followed."
    And the "Follow" button should be disabled
    And the user should be provided an option to report if they believe the flagging is an error

    Examples:
      | flagged_task_tag      |
      | #inappropriate        |
      | #offensivetag         |
