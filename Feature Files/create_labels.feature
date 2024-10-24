Feature: Create labels for tasks
    As a project manager,
    I want to create labels for tasks (e.g., urgent, bug, feature),
    So that I can categorize and prioritize work.

    # Normal Flow: Create a label
    Scenario Outline: Successfully create a label
        Given the project manager is logged in
        When the project manager navigates to the "Create Label" page
        And the project manager enters a label name "<label_name>"
        And the project manager clicks the "Create" button
        Then the label should be created successfully
        And the label should be visible in the list of labels

        Examples:
            | label_name |
            | Urgent     |
            | Bug        |
            | Feature    |

    # Alternate Flow: Cancel label creation
    Scenario: Cancel creating a label
        Given the project manager is logged in
        When the project manager navigates to the "Create Label" page
        And the project manager decides not to create a label
        Then the project manager should be redirected to the labels list page

    # Alternate Flow: Add a description to the label
    Scenario Outline: Add a description to the label
        Given the project manager is logged in
        When the project manager navigates to the "Create Label" page
        And the project manager enters a label name "<label_name>" and description "<description>"
        And the project manager clicks the "Create" button
        Then the label should be created successfully
        And the label should display the entered description

        Examples:
            | label_name | description                      |
            | Urgent     | Needs immediate attention        |
            | Bug        | Indicates a bug in the system    |
            | Feature    | Represents a new feature request |

    # Error Flow: Missing label name
    Scenario: Create a label with missing name
        Given the project manager is logged in
        When the project manager navigates to the "Create Label" page
        And the project manager leaves the label name blank
        And the project manager clicks the "Create" button
        Then the label should not be created
        And the project manager should see an error message indicating that the label name is required

    # Error Flow: Duplicate label name
    Scenario Outline: Create a label with a duplicate name
        Given the project manager is logged in
        When the project manager navigates to the "Create Label" page
        And the project manager enters a label name that already exists "<duplicate_label_name>"
        And the project manager clicks the "Create" button
        Then the label should not be created
        And the project manager should see an error message indicating that the label name already exists

        Examples:
            | duplicate_label_name |
            | Urgent               |
            | Bug                  |
            | Feature              |