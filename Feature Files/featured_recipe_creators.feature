Feature: Highlight Featured Recipe Creators
  As an admin, I want to highlight featured recipe creators on the homepage,
  so I can promote top users and inspire more engagement.

  Background:
    Given the admin is logged into the platform
    And the admin is viewing the admin dashboard

  # Normal Flow
  Scenario Outline: Successfully highlight a featured recipe creator on the homepage
    When the admin selects "<creator>" as a featured recipe creator
    And confirms the selection
    Then the system should display "<creator>" on the homepage under the "Featured Creators" section
    And users should see "<creator>" prominently displayed on the homepage

    Examples:
      | creator       |
      | ChefSalads    |
      | DressingGuru  |
      | VeganMaster   |

  # Alternate Flow: Feature multiple creators at once
  Scenario Outline: Successfully highlight multiple recipe creators on the homepage
    When the admin selects multiple creators "<creator_list>" to feature
    And confirms the selection
    Then the system should display "<creator_list>" in a rotating or carousel format under the "Featured Creators" section on the homepage

    Examples:
      | creator_list            |
      | ChefSalads, VeganMaster |
      | DressingGuru, SpiceQueen|

  # Alternate Flow: Change a featured recipe creator
  Scenario Outline: Change the current featured recipe creator
    Given "<current_creator>" is currently featured on the homepage
    When the admin selects "<new_creator>" as a replacement
    And confirms the change
    Then the system should replace "<current_creator>" with "<new_creator>" in the "Featured Creators" section
    And users should see "<new_creator>" featured on the homepage

    Examples:
      | current_creator | new_creator  |
      | ChefSalads      | VeganMaster  |
      | DressingGuru    | SpiceQueen   |

  # Alternate Flow: Schedule future feature promotions
  Scenario Outline: Schedule a creator to be featured at a future date
    When the admin schedules "<creator>" to be featured on "<date>"
    Then the system should automatically feature "<creator>" in the "Featured Creators" section on "<date>"
    And the system should notify the admin when the feature goes live

    Examples:
      | creator       | date         |
      | ChefSalads    | 2024-11-01   |
      | DressingGuru  | 2024-12-15   |

  # Error Flow: Attempt to feature an already featured creator
  Scenario Outline: Admin tries to feature a creator already featured
    Given "<creator>" is already featured on the homepage
    When the admin selects "<creator>" to feature again
    Then the system should display a message: "This creator is already featured."
    And the system should prevent duplicate featuring of the same creator

    Examples:
      | creator       |
      | ChefSalads    |
      | VeganMaster   |

  # Error Flow: Admin exceeds the maximum number of featured creators
  Scenario Outline: Admin tries to feature more than the maximum allowed creators
    Given the maximum number of allowed featured creators is "<max_creators>"
    When the admin tries to feature more than "<max_creators>" creators at once
    Then the system should display a message: "You can only feature a maximum of <max_creators> creators."
    And the admin should be prompted to remove an existing featured creator before adding more

    Examples:
      | max_creators  |
      | 3             |
      | 5             |