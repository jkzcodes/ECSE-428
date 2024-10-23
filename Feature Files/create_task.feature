Feature: Add tasks to the Kanban board
    As a team member,
    I want to add tasks to the Kanban board,
    So that I can keep track of my work.

    # Normal Flow: Add a task
    Scenario: Successfully add a task to the Kanban board
        Given the user is logged in
        When the user navigates to the "Kanban Board" page
        And the user clicks the "Add Task" button
        And the user enters a task title "<task_title>" and description "<task_description>"
        And the user clicks the "Save" button
        Then the task should be added to the Kanban board
        And the task should be visible on the board

        Examples:
            | task_title       | task_description       |
            | Implement login  | Create login feature   |
            | Design homepage  | Design the homepage UI |
            | Write tests      | Write unit tests       |

    # Alternate Flow: Cancel task creation
    Scenario: Cancel adding a task
        Given the user is logged in
        When the user navigates to the "Kanban Board" page
        And the user clicks the "Add Task" button
        And the user decides not to add a task
        Then the user should be redirected to the "Kanban Board" page

    # Alternate Flow: Add a task with a due date
    Scenario: Add a task with a due date
        Given the user is logged in
        When the user navigates to the "Kanban Board" page
        And the user clicks the "Add Task" button
        And the user enters a task title "<task_title>", description "<task_description>", and due date "<due_date>"
        And the user clicks the "Save" button
        Then the task should be added to the Kanban board
        And the task should display the due date

        Examples:
            | task_title       | task_description       | due_date   |
            | Implement login  | Create login feature   | 2023-10-15 |
            | Design homepage  | Design the homepage UI | 2023-10-20 |
            | Write tests      | Write unit tests       | 2023-10-25 |

    # Error Flow: Missing task title
    Scenario: Add a task with missing title
        Given the user is logged in
        When the user navigates to the "Kanban Board" page
        And the user clicks the "Add Task" button
        And the user enters a description but leaves the title blank
        And the user clicks the "Save" button
        Then the task should not be added
        And the user should see an error message indicating that the title is required

    # Error Flow: Missing task description
    Scenario: Add a task with missing description
        Given the user is logged in
        When the user navigates to the "Kanban Board" page
        And the user clicks the "Add Task" button
        And the user enters a title but leaves the description blank
        And the user clicks the "Save" button
        Then the task should not be added
        And the user should see an error message indicating that the description is required