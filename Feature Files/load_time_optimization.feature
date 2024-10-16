Feature: Load Time Optimization (Web and Mobile)
  The system shall ensure that all pages load within 2 seconds or less under normal operating conditions,
  including when displaying high-resolution images, to provide a seamless and smooth user experience.

  Background:
    Given the system is operating under normal conditions

  Scenario Outline: Ensure pages load within 2 seconds
    Given the user is accessing the system from a <device>
    When the user navigates to a specific page
    And the page contains <content_type>
    Then the page should load within 2 seconds

    Examples:
      | device       | content_type          |
      | web          | high-resolution images|
      | web          | multiple text sections|
      | web          | a mix of media content|
      | web          | interactive elements  |
      | mobile       | high-resolution images|
      | mobile       | multiple text sections|
      | mobile       | a mix of media content|
      | mobile       | interactive elements  |

  Scenario: Page load fails due to network disconnection
    Given the user is experiencing network connectivity issues
    When the user navigates to a page containing interactive elements
    Then the page should not load
    And the system should display an error message: "Network connection lost. Please check your internet connection."

  Scenario: Page load timeout due to server issue
    Given the system is experiencing server-side issues
    When the user navigates to a page containing multiple text sections
    Then the page should fail to load within 2 seconds
    And the system should display an error message: "Page failed to load. Please try again later."