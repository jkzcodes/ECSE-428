Feature: Archive a Kanban task
    As a team member,
    I want to archive a Kanban task,
    So that it cannot be seen by other users.

    # Normal Flow: Archive a task
    Scenario: Successfully archive a Kanban task
        Given the user is logged in
        And the user is on the Kanban board
        When the user selects a task with title "<task_title>"
        And the user clicks the "Archive" button
        Then the task should be archived successfully
        And the task should no longer be visible on the Kanban board

        Examples:
            | task_title |
            | Task 1     |
            | Task 2     |
            | Task 3     |

    # Alternate Flow: Cancel archiving a task
    Scenario: Cancel archiving a Kanban task
        Given the user is logged in
        And the user is on the Kanban board
        When the user selects a task with title "<task_title>"
        And the user decides not to archive the task
        Then the task should remain visible on the Kanban board

        Examples:
            | task_title |
            | Task 1     |
            | Task 2     |
            | Task 3     |