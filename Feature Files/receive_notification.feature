Feature: Receive notification for comments on assigned tasks
  As a user,
  I want to receive a notification when someone comments on one of the tasks I am assigned to,
  So that it can be displayed in my "notifications" tab.

  # Normal Flow: Receive a notification for a comment
  Scenario: Successfully receive a notification for a comment
    Given the user is logged in
    And the user is assigned to a task
    When another user comments on the task
    Then the user should receive a notification
    And the notification should be displayed in the "notifications" tab

  # Alternate Flow: View notification details
  Scenario: View details of a notification
    Given the user is logged in
    And the user has received a notification for a comment
    When the user navigates to the "notifications" tab
    And the user clicks on the notification
    Then the user should see the details of the comment

  # Error Flow: Notification fails due to user’s notification settings
  Scenario: Notification fails due to notification settings being disabled
    Given the user is logged in
    And the user is assigned to a task
    And the user has disabled notifications for task comments
    When another user comments on the task
    Then the user should not receive a notification
    And the system should log that the notification was skipped due to the user’s settings
    And the user should see a message under "notifications settings": "You have disabled notifications for task comments."

