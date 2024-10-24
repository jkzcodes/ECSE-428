Feature: Tag Kanban Items with Categories
  As a user, I want to tag Kanban items with categories,
  so I can better organize tasks and find relevant work items on the collective Kanban board.

  Background:
    Given the user is logged into the platform
    And the user is creating a new Kanban item on the collective Kanban board

  # Normal Flow
  Scenario: Successfully tag a Kanban item with categories
    When the user selects categories from the list
    And the user submits the Kanban item
    Then the system should display the selected categories on the Kanban item
    And the item should be listed under the chosen categories on the collective board

  # Alternate Flow: No categories selected
  Scenario: Kanban item without categories
    Given the user did not select any categories
    When the user submits the Kanban item
    Then the system should publish the item without any categories
    And the item should be visible in the general list on the board

  # Alternate Flow: Exceeding category limit
  Scenario: User attempts to select more than the allowed number of categories
    When the user selects more than 3 categories
    Then the system should display an error message: "You can only select up to 3 categories."
    And the Kanban item should not be submitted

  # Error Flow: Category selection fails due to network issue
  Scenario: Tagging categories fails due to network connection issue
    When the user clicks "Submit"
    And there is a network connection issue
    Then the system should display an error message: "Unable to save categories. Please check your connection and try again."
    And the user should remain on the Kanban item creation page with the selected categories intact
