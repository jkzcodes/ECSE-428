Feature: Invite Friends to Meet-Up Event
  As a user, I want to invite my friends to a meet-up event by sending them notifications or emails,
  so they can join the event quickly.

  Background:
    Given the user is logged into the platform
    And the user has created a salad dressing meet-up event

  # Normal Flow
  Scenario Outline: Successfully invite friends to a meet-up event via notifications or email
    When the user selects friends "<friends_list>" to invite to the meet-up
    And the user chooses to send invitations via "<invite_method>"
    And the user clicks the "Send Invitations" button
    Then the system should send the invitations via "<invite_method>" to "<friends_list>"
    And the invited friends should receive the invitations immediately

    Examples:
      | friends_list          | invite_method |
      | Alice, Bob            | notifications |
      | Charlie, Dave, Eve     | email         |

  # Alternate Flow: Invite all friends at once
  Scenario Outline: Invite all friends to the meet-up event at once
    When the user selects the option to "Invite All Friends"
    And the user chooses to send invitations via "<invite_method>"
    And the user clicks the "Send Invitations" button
    Then the system should send invitations to all of the user’s friends via "<invite_method>"
    And all friends should receive the invitations immediately

    Examples:
      | invite_method  |
      | notifications  |
      | email          |

  # Error Flow: Some friends are not reachable by the chosen method
  Scenario Outline: Fail to invite some friends due to unreachable contact method
    When the user selects "<friends_list>" to invite to the meet-up
    And the user chooses "<invite_method>" to send invitations
    And some friends do not have "<invite_method>" set up
    Then the system should send invitations only to reachable friends
    And the user should be notified that some friends (e.g., "<unreachable_friends>") could not be invited via "<invite_method>"

    Examples:
      | friends_list         | invite_method | unreachable_friends |
      | Alice, Bob, Eve      | email         | Bob                 |
      | Charlie, Dave        | notifications | Dave                |