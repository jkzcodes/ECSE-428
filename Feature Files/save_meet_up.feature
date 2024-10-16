Feature: Save Favorite Meet-Up Events
  As a user, I want to save my favorite meet-up events,
  so I can easily access them later and receive reminders as the event date approaches.

  Background:
    Given the user is logged into the platform
    And the user is viewing a list of upcoming meet-up events

  # Normal Flow
  Scenario Outline: Successfully save a meet-up event to favorites
    When the user clicks the "Save to Favorites" button for the meet-up event "<event_name>"
    Then the system should add "<event_name>" to the user’s list of favorite events
    And the user should be able to access "<event_name>" from their "Favorite Events" page

    Examples:
      | event_name                 |
      | Vegan Dressings Only       |
      | Low-Calorie Dressings Meet |
      | Mediterranean Flavors Party|

  # Alternate Flow: Remove a meet-up event from favorites
  Scenario Outline: Remove a meet-up event from favorites
    Given the user has saved "<event_name>" to their favorites
    When the user clicks the "Remove from Favorites" button for "<event_name>"
    Then the system should remove "<event_name>" from the user’s list of favorite events
    And "<event_name>" should no longer be accessible from the "Favorite Events" page

    Examples:
      | event_name                 |
      | Low-Calorie Dressings Meet |
      | Mediterranean Flavors Party|

  # Error Flow: Attempt to save an already saved event
  Scenario Outline: Attempt to save an event already in favorites
    Given "<event_name>" is already in the user’s favorites
    When the user clicks the "Save to Favorites" button again for "<event_name>"
    Then the system should display a message: "This event is already in your favorites."
    And the system should prevent adding duplicate entries

    Examples:
      | event_name                 |
      | Vegan Dressings Only       |
      | Low-Calorie Dressings Meet |