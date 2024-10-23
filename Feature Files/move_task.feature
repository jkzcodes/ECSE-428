Feature: Move a task between columns
    As a team member,
    I want to move tasks between columns,
    So that I can update the status of my work.

    # Normal Flow: Move a task to a different column
    Scenario: Successfully move a task to a different column
        Given the user is logged in
        And the user is on the task board page
        When the user drags a task from the "To Do" column to the "In Progress" column
        Then the task should be moved to the "In Progress" column
        And the task status should be updated to "In Progress"

    # Alternate Flow: Cancel moving a task
    Scenario: Cancel moving a task
        Given the user is logged in
        And the user is on the task board page
        When the user starts dragging a task but drops it back in the "To Do" column
        Then the task should remain in the "To Do" column
        And the task status should remain "To Do"

    # Alternate Flow: Move a task to the "Done" column
    Scenario: Move a task to the "Done" column
        Given the user is logged in
        And the user is on the task board page
        When the user drags a task from the "In Progress" column to the "Done" column
        Then the task should be moved to the "Done" column
        And the task status should be updated to "Done"

    # Error Flow: Move a task without proper permissions
    Scenario: Move a task without proper permissions
        Given the user is logged in
        And the user is on the task board page
        And the user does not have permission to move tasks
        When the user tries to drag a task to a different column
        Then the task should not be moved
        And the user should see an error message indicating that they do not have permission to move tasks