Feature: Create Salad Dressing Meet-Up Event
  As a user, I want to create a salad dressing meet-up event by specifying the location, date, time, and theme,
  so I can organize gatherings with others who share my interests.

  Background:
    Given the user is logged into the platform
    And the user is on the "Create Meet-Up" page

  # Normal Flow
  Scenario Outline: Successfully create a salad dressing meet-up event
    When the user specifies the location "<location>"
    And the user specifies the date "<date>"
    And the user specifies the time "<time>"
    And the user specifies the theme "<theme>"
    And the user clicks on the "Create Event" button
    Then the system should create the event with the specified details
    And the event should be visible to other users with "<theme>"

    Examples:
      | location       | date        | time    | theme                   |
      | Central Park   | 2024-11-05  | 12:00PM | Vegan Dressings Only     |
      | Riverside Cafe | 2024-12-15  | 06:00PM | Low-Calorie Dressings    |
      | City Square    | 2025-01-10  | 02:00PM | Mediterranean Flavors    |


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


  # Alternate Flow: Schedule a recurring event
  Scenario Outline: Create a recurring meet-up event
    When the user specifies the location "<location>"
    And the user specifies the date "<date>"
    And the user specifies the time "<time>"
    And the user specifies the theme "<theme>"
    And the user selects the option to "Repeat Event" every "<frequency>"
    And the user clicks "Create Event"
    Then the system should create a recurring event with "<frequency>" and display the next occurrence on the homepage

    Examples:
      | location       | date        | time    | theme                   | frequency    |
      | Central Park   | 2024-11-05  | 12:00PM | Vegan Dressings Only     | weekly       |
      | City Square    | 2025-01-10  | 02:00PM | Mediterranean Flavors    | monthly      |