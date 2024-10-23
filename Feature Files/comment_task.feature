Feature: Comment on a Kanban task
    As a team member,
    I want to comment on a Kanban task,
    So that other team members can see my comment.

    # Normal Flow: Add a comment to a task
    Scenario: Successfully add a comment to a Kanban task
        Given the user is logged in
        And the user navigates to the Kanban board
        When the user selects a task "<task_name>"
        And the user enters a comment "<comment_text>"
        And the user clicks the "Add Comment" button
        Then the comment should be added to the task
        And the comment should be visible to other team members

        Examples:
            | task_name       | comment_text                |
            | Task 1          | This is a comment           |
            | Task 2          | Please review this task     |
            | Task 3          | Need more information       |

    # Alternate Flow: Cancel adding a comment
    Scenario: Cancel adding a comment to a Kanban task
        Given the user is logged in
        And the user navigates to the Kanban board
        When the user selects a task "<task_name>"
        And the user decides not to add a comment
        Then the user should be redirected to the Kanban board without adding a comment

    # Error Flow: Missing comment text
    Scenario: Add a comment with missing text
        Given the user is logged in
        And the user navigates to the Kanban board
        When the user selects a task "<task_name>"
        And the user leaves the comment text blank
        And the user clicks the "Add Comment" button
        Then the comment should not be added
        And the user should see an error message indicating that the comment text is required