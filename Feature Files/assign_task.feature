Feature: Assign tasks to team members
    As a project manager,
    I want to assign tasks to team members,
    So that everyone knows their responsibilities.

    # Normal Flow
    Scenario: Successfully assign a task to a team member
        Given the project manager is logged in
        When the project manager selects a task with its title "<task_title>"
        And the project manager navigates to the "Assign Task" page
        And the project manager selects a team member "<team_member>" from the list
        And the project manager clicks the "Assign" button
        Then the task should be assigned successfully
        And the team member should see the assigned task in their task list

        Examples:
            | team_member | task_title      |
            | Alice       | Design Database |
            | Bob         | Implement API   |
            | Carol       | Write Tests     |

    # Alternate Flow: Cancel Task Assignment
    Scenario: Cancel assigning a task
        Given the project manager is logged in
        When the project manager selects a task with its title "<task_title>"
        And the project manager navigates to the "Assign Task" page
        And the project manager decides not to assign a task
        Then the project manager should be redirected to the project dashboard