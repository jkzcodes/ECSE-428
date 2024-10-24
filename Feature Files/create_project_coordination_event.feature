Feature: Create Project Coordination Event
  As a project manager or team member, I want to create a project coordination event by specifying the location, date, time, and purpose, so I can organize team gatherings and ensure everyone is aligned.

  Background:
    Given the user is logged into the platform
    And the user is on the "Create Event" page

  # Normal Flow
  Scenario Outline: Successfully create a project coordination event
    When the user specifies the location "<location>"
    And the user specifies the date "<date>"
    And the user specifies the time "<time>"
    And the user specifies the purpose "<purpose>"
    And the user clicks on the "Create Event" button
    Then the system should create the event with the specified details
    And the event should be visible to the project team on the Kanban board with "<purpose>"

    Examples:
      | location       | date        | time    | purpose                 |
      | Conference Room | 2024-11-05  | 10:00AM | Sprint Planning          |
      | Online (Zoom)  | 2024-12-01  | 03:00PM | Retrospective Meeting    |
      | Main Office    | 2025-01-15  | 09:00AM | Team Brainstorming       |

  # Error Flow: Event creation fails due to missing required fields
  Scenario Outline: Fail to create an event due to missing fields
    When the user attempts to create an event without specifying "<missing_field>"
    Then the system should display an error message: "The <missing_field> is required to create an event."
    And the event should not be created until the required fields are filled

    Examples:
      | missing_field  |
      | location       |
      | date           |
      | time           |
      | purpose        |

  # Alternate Flow: Schedule a recurring event
  Scenario Outline: Create a recurring project coordination event
    When the user specifies the location "<location>"
    And the user specifies the date "<date>"
    And the user specifies the time "<time>"
    And the user specifies the purpose "<purpose>"
    And the user selects the option to "Repeat Event" every "<frequency>"
    And the user clicks "Create Event"
    Then the system should create a recurring event with "<frequency>" and display the next occurrence on the Kanban board

    Examples:
      | location       | date        | time    | purpose                 | frequency  |
      | Conference Room | 2024-11-05  | 10:00AM | Sprint Planning          | weekly     |
      | Online (Zoom)  | 2025-01-15  | 09:00AM | Retrospective Meeting    | monthly    |
