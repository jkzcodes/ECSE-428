Feature: Delete a Kanban task
    As a team member user,
    I want to delete a Kanban task,
    So that it is no longer accessible by anyone.

    # Normal Flow: Successfully delete a Kanban task
    Scenario: Successfully delete a Kanban task
        Given the user is logged in
        And the user is on the Kanban board page
        When the user selects a task with the title "<task_title>"
        And the user clicks the "Delete" button
        Then the task should be deleted successfully
        And the task should no longer be visible on the Kanban board

        Examples:
            | task_title       |
            | Design Homepage  |
            | Implement API    |
            | Write Unit Tests |

    # Alternate Flow: Cancel task deletion
    Scenario: Cancel deleting a Kanban task
        Given the user is logged in
        And the user is on the Kanban board page
        When the user selects a task with the title "<task_title>"
        And the user clicks the "Delete" button
        And the user clicks the "Cancel" button in the confirmation dialog
        Then the task should not be deleted
        And the task should still be visible on the Kanban board

        Examples:
            | task_title       |
            | Design Homepage  |
            | Implement API    |
            | Write Unit Tests |