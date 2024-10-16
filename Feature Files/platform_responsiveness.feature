Feature: Platform Responsiveness on Mobile Devices
  The application shall be fully responsive on mobile devices, ensuring users can browse, post, and interact with it
  from their phones.

  Background:
    Given the system is operating under normal conditions

  Scenario Outline: Ensure platform is fully responsive on mobile devices
    Given the user is accessing the platform from a mobile device in <orientation> orientation
    When the user browses the platform
    And the user posts content on the platform
    And the user interacts with other users' content
    Then the platform should adjust its layout and respond appropriately to the <orientation> orientation

    Examples:
      | orientation |
      | landscape   |
      | portrait    |

  Scenario: Ensure the platform is fully responsive with a slow network connection
    Given the user is accessing the platform from a mobile device on a slow network
    When the user browses the platform
    And the user posts content on the platform
    And the user interacts with other users' content
    Then the platform should remain responsive, but display loading indicators for slow content

  Scenario: Ensure the platform handles offline mode gracefully on mobile
    Given the user is accessing the platform from a mobile device
    And the device loses internet connectivity
    When the user attempts to browse the platform
    Then the platform should display an offline message
    And allow the user to continue interacting with cached content

