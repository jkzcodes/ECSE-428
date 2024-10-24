Feature: Invite Team Members to Project Event
  As a project manager or team member, I want to invite my team members to a project event by sending them notifications or emails, so they can join the event quickly.

  Background:
    Given the user is logged into the platform
    And the user has created a project coordination event (e.g., sprint planning, team meeting)

  # Normal Flow
  Scenario Outline: Successfully invite team members to a project event via notifications or email
    When the user selects team members "<team_members_list>" to invite to the project event
    And the user chooses to send invitations via "<invite_method>"
    And the user clicks the "Send Invitations" button
    Then the system should send the invitations via "<invite_method>" to "<team_members_list>"
    And the invited team members should receive the invitations immediately

    Examples:
      | team_members_list    | invite_method |
      | Alice, Bob           | notifications |
      | Charlie, Dave, Eve    | email         |

  # Alternate Flow: Invite all team members at once
  Scenario Outline: Invite all team members to the project event at once
    When the user selects the option to "Invite All Team Members"
    And the user chooses to send invitations via "<invite_method>"
    And the user clicks the "Send Invitations" button
    Then the system should send invitations to all of the team members via "<invite_method>"
    And all team members should receive the invitations immediately

    Examples:
      | invite_method  |
      | notifications  |
      | email          |

  # Error Flow: Some team members are not reachable by the chosen method
  Scenario Outline: Fail to invite some team members due to unreachable contact method
    When the user selects "<team_members_list>" to invite to the project event
    And the user chooses "<invite_method>" to send invitations
    And some team members do not have "<invite_method>" set up
    Then the system should send invitations only to reachable team members
    And the user should be notified that some team members (e.g., "<unreachable_team_members>") could not be invited via "<invite_method>"

    Examples:
      | team_members_list     | invite_method | unreachable_team_members |
      | Alice, Bob, Eve       | email         | Bob                      |
      | Charlie, Dave         | notifications | Dave                     |
