Feature: Reply to Comments in a Thread Format
  As a user, I want to reply to other comments in a thread format under a recipe,
  so I can have organized conversations about the dish.

  Background:
    Given the user is logged into the platform
    And the user is viewing the comment section of a recipe

  # Normal Flow
  Scenario Outline: Successfully reply to a comment in a thread
    When the user replies to "<parent_comment>" with "<reply_text>"
    Then the system should add the reply under "<parent_comment>" in a threaded format
    And the reply should be visible to other users under the recipe

    Examples:
      | parent_comment            | reply_text             |
      | "I love this recipe!"     | "Me too, it’s great!"  |
      | "Can I substitute oil?"   | "Yes, try olive oil!"  |

  # Alternate Flow: Reply to an already threaded reply
  Scenario Outline: Reply to an existing threaded reply
    Given the user is viewing a threaded reply to "<parent_comment>"
    When the user replies to "<reply_text>"
    Then the system should add the new reply under the existing reply, maintaining the thread structure
    And the conversation should be visible as a nested reply under the original comment

    Examples:
      | parent_comment            | reply_text             |
      | "I love this recipe!"     | "It’s amazing, right?" |
      | "Can I substitute oil?"   | "Yes, coconut oil works!" |


  # Error Flow: Reply fails due to deleted parent comment
  Scenario Outline: Reply fails because the parent comment was deleted
    When the user replies to "<parent_comment>" with "<reply_text>"
    And "<parent_comment>" has been deleted by the original author or admin
    Then the system should display an error message: "The comment you are replying to no longer exists."
    And the user should be able to post the reply as a new top-level comment

    Examples:
      | parent_comment            | reply_text             |
      | "I love this recipe!"     | "Me too, it’s great!"  |
      | "Can I substitute oil?"   | "Yes, try olive oil!"  |