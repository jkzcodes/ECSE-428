Feature: Report Kanban Item
  As a user, I want to report inappropriate or erroneous Kanban items,
  so the platform can take action to review or remove items that violate the guidelines.

  Background:
    Given the user is logged into the platform
    And the user is viewing a Kanban item they believe violates the guidelines

  # Normal Flow
  Scenario: Successfully report a Kanban item
    When the user clicks on the "Report Item" button
    And the user selects a reason for reporting the item
    Then the system should send the report for review
    And the user should see a confirmation message that the item has been reported

  # Alternate Flow: Report Kanban item without selecting a reason
  Scenario: User attempts to report an item without selecting a reason
    When the user clicks the "Report Item" button
    And the user does not select a reason for reporting
    Then the system should display an error message: "Please select a reason to report the item."
    And the report should not be submitted

  # Alternate Flow: Item already reported
  Scenario: User tries to report a Kanban item they have already reported
    Given the user has previously reported the same Kanban item
    When the user clicks on the "Report Item" button again
    Then the system should display a message indicating the item has already been reported
    And no duplicate report should be sent

  # Error Flow: Reporting fails due to network issue
  Scenario: Reporting fails due to network connection issue
    When the user clicks "Report Item"
    And there is a network connection issue
    Then the system should display an error message: "Unable to report the item. Please check your connection and try again."
    And the user should remain on the Kanban board

  # Error Flow: Reporting fails due to item being removed
  Scenario: User tries to report a Kanban item that has already been removed
    When the user clicks the "Report Item" button
    And the item has been removed by the time the report is processed
    Then the system should display a message: "This item has already been removed."
    And no report should be submitted
