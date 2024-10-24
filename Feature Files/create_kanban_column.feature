Feature: Create a Kanban column
    As a project manager,
    I want to create a new column,
    So that I can customize a Kanban board and team members can move tasks to that column.

    # Normal Flow: Create a new Kanban column
    Scenario Outline: Successfully create a new Kanban column
        Given the project manager is logged in
        When the project manager navigates to the "Kanban Board" page
        And the project manager clicks the "Add Column" button
        And the project manager enters a column name "<column_name>"
        And the project manager clicks the "Create" button
        Then the new column should be created successfully
        And the new column should be visible on the Kanban board

        Examples:
            | column_name     |
            | To Do           |
            | In Progress     |
            | Done            |

    # Alternate Flow: Cancel column creation
    Scenario: Cancel creating a new Kanban column
        Given the project manager is logged in
        When the project manager navigates to the "Kanban Board" page
        And the project manager clicks the "Add Column" button
        And the project manager decides not to create a column
        Then the project manager should be redirected to the Kanban board without creating a new column

    # Error Flow: Missing column name
    Scenario: Create a column with missing name
        Given the project manager is logged in
        When the project manager navigates to the "Kanban Board" page
        And the project manager clicks the "Add Column" button
        And the project manager leaves the column name blank
        And the project manager clicks the "Create" button
        Then the column should not be created
        And the project manager should see an error message indicating that the column name is required