Feature: Edit a Kanban task
    As a team member,
    I want to modify a Kanban task,
    So that my changes can be seen by other users.

    # Normal Flow: Edit a task
    Scenario Outline: Successfully edit a Kanban task
        Given the user is logged in
        And the user is on the Kanban board
        When the user selects a task to edit
        And the user changes the task title to "<new_title>", description to "<new_description>"
        And the user clicks the "Save" button
        Then the task should be updated successfully
        And the changes should be visible to other users

        Examples:
            | new_title      | new_description        |
            | Update README  | Update the README file |
            | Fix Bug #123   | Fix the critical bug   |
            | Design Mockups | Create new mockups     |

    # Alternate Flow: Cancel task editing
    Scenario: Cancel editing a Kanban task
        Given the user is logged in
        And the user is on the Kanban board
        When the user selects a task to edit
        And the user decides not to save the changes
        Then the user should be redirected to the Kanban board without saving changes

    # Alternate Flow: Add a due date to the task
    Scenario Outline: Add a due date to the Kanban task
        Given the user is logged in
        And the user is on the Kanban board
        When the user selects a task to edit
        And the user changes the task title to "<new_title>", description to "<new_description>", and adds a due date "<due_date>"
        And the user clicks the "Save" button
        Then the task should be updated successfully
        And the changes should be visible to other users

        Examples:
            | new_title      | new_description        | due_date   |
            | Update README  | Update the README file | 2023-10-15 |
            | Fix Bug #123   | Fix the critical bug   | 2023-10-20 |
            | Design Mockups | Create new mockups     | 2023-10-25 |

    # Error Flow: Missing Title
    Scenario: Edit a task with missing title
        Given the user is logged in
        And the user is on the Kanban board
        When the user selects a task to edit
        And the user leaves the task title blank
        And the user clicks the "Save" button
        Then the task should not be updated
        And the user should see an error message indicating that the title is required

    # Error Flow: Missing Description
    Scenario: Edit a task with missing description
        Given the user is logged in
        And the user is on the Kanban board
        When the user selects a task to edit
        And the user leaves the task description blank
        And the user clicks the "Save" button
        Then the task should not be updated
        And the user should see an error message indicating that the description is required