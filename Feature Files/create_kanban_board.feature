Feature: Create Kanban Board
    As a project manager,
    I want to create new Kanban boards,
    So that I can visualize different projects effectively.

    Background:
        Given I am logged into the project management application

    # Normal flow: Create a new Kanban board
    Scenario Outline: Successfully create a new Kanban board
        When I navigate to the "Create Board" page
        And I enter "<board_name>" in the board name field
        And I click the "Create" button
        Then I should see the "<board_name>" board in my list of boards

        Examples:
            | board_name |
            | Project A  |
            | Project B  |

    # Alternate flow: Create a new Kanban board with optional description
    Scenario Outline: Successfully create a new Kanban board with a description
        When I navigate to the "Create Board" page
        And I enter "<board_name>" in the board name field
        And I enter "<description>" in the description field
        And I click the "Create" button
        Then I should see the "<board_name>" board with the description in my list of boards

        Examples:
            | board_name | description                         |
            | Project B  | This is a description for Project B |

    # Error flow: Create a new Kanban board with an existing name
    Scenario Outline: Fail to create a new Kanban board with an existing name
        Given a board named "<existing_board_name>" already exists
        When I navigate to the "Create Board" page
        And I enter "<existing_board_name>" in the board name field
        And I click the "Create" button
        Then I should see an error message "A board with this name already exists"

        Examples:
            | existing_board_name |
            | Project C           |

    # Error flow: Create a new Kanban board with an empty name
    Scenario: Fail to create a new Kanban board with an empty name
        When I navigate to the "Create Board" page
        And I leave the board name field empty
        And I click the "Create" button
        Then I should see an error message "Board name cannot be empty"