Feature: Highlight Featured Team Members
  As an project manager, I want to highlight featured team members on the project board,
  so I can promote key contributors and inspire more engagement from the team.

  Background:
    Given the admin is logged into the platform
    And the admin is viewing the admin dashboard

  # Normal Flow
  Scenario Outline: Successfully highlight a featured team member on the project board
    When the admin selects "<team_member>" as a featured team member
    And confirms the selection
    Then the system should display "<team_member>" on the project board under the "Featured Team Members" section
    And users should see "<team_member>" prominently displayed on the board

    Examples:
      | team_member     |
      | Alice Johnson   |
      | Bob Lee         |
      | Sarah Adams     |

  # Alternate Flow: Feature multiple team members at once
  Scenario Outline: Successfully highlight multiple team members on the project board
    When the admin selects multiple team members "<team_member_list>" to feature
    And confirms the selection
    Then the system should display "<team_member_list>" in a rotating or carousel format under the "Featured Team Members" section on the project board

    Examples:
      | team_member_list       |
      | Alice Johnson, Bob Lee |
      | Sarah Adams, Mark Lee  |

  # Alternate Flow: Change a featured team member
  Scenario Outline: Change the current featured team member
    Given "<current_team_member>" is currently featured on the project board
    When the admin selects "<new_team_member>" as a replacement
    And confirms the change
    Then the system should replace "<current_team_member>" with "<new_team_member>" in the "Featured Team Members" section
    And users should see "<new_team_member>" featured on the project board

    Examples:
      | current_team_member | new_team_member |
      | Alice Johnson       | Sarah Adams     |
      | Bob Lee             | Mark Lee        |

  # Alternate Flow: Schedule future feature promotions
  Scenario Outline: Schedule a team member to be featured at a future date
    When the admin schedules "<team_member>" to be featured on "<date>"
    Then the system should automatically feature "<team_member>" in the "Featured Team Members" section on "<date>"
    And the system should notify the admin when the feature goes live

    Examples:
      | team_member   | date         |
      | Alice Johnson | 2024-11-01   |
      | Bob Lee       | 2024-12-15   |

  # Error Flow: Attempt to feature an already featured team member
  Scenario Outline: Admin tries to feature a team member already featured
    Given "<team_member>" is already featured on the project board
    When the admin selects "<team_member>" to feature again
    Then the system should display a message: "This team member is already featured."
    And the system should prevent duplicate featuring of the same team member

    Examples:
      | team_member   |
      | Alice Johnson |
      | Sarah Adams   |

  # Error Flow: Admin exceeds the maximum number of featured team members
  Scenario Outline: Admin tries to feature more than the maximum allowed team members
    Given the maximum number of allowed featured team members is "<max_team_members>"
    When the admin tries to feature more than "<max_team_members>" team members at once
    Then the system should display a message: "You can only feature a maximum of <max_team_members> team members."
    And the admin should be prompted to remove an existing featured team member before adding more

    Examples:
      | max_team_members |
      | 3                |
      | 5                |
