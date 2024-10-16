Feature: Multi-language Support
  The application shall support multiple languages, ensuring accessibility for users from different regions.

  Background:
    Given the user is on the application homepage

  Scenario: Display application in different languages
    When the user selects "<language>" as their preferred language
    Then the application should display all text, buttons, and menus in "<language>"
    And the content should be fully accessible in "<language>"

  Scenario: Retain language preference after logout and login
    Given the user has selected "<browser_language>" as their preferred language
    When the user logs out and logs back in
    Then the application should continue to display all text, buttons, and menus in "<browser_language>"

  Scenario Outline: Automatically detect and set language based on browser settings
    Given the user's browser language is set to "<browser_language>"
    When the user opens the application for the first time
    Then the application should automatically display all text, buttons, and menus in "<browser_language>"
    And the content should be fully accessible in "<browser_language>"

    Examples:
      | browser_language |
      | French           |
      | English          |

  Scenario Outline: Change language preference
    Given the user has the application set to "<current_language>"
    When the user switches their language preference to "<new_language>"
    Then the application should reload and display all text, buttons, and menus in "<new_language>"
    And the content should be fully accessible in "<new_language>"

    Examples:
      | current_language | new_language |
      | English          | French       |
      | French           | English      |

