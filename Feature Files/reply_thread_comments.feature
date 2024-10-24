Feature: Reply to Comments in a Thread Format
  As a project manager or team member, I want to reply to other comments in a thread format under a project task or discussion, so I can have organized conversations about the project.

  Background:
    Given the user is logged into the platform
    And the user is viewing the comment section of a project task or discussion

  # Normal Flow
  Scenario Outline: Successfully reply to a comment in a thread
    When the user replies to "<parent_comment>" with "<reply_text>"
    Then the system should add the reply under "<parent_comment>" in a threaded format
    And the reply should be visible to other team members under the task or discussion

    Examples:
      | parent_comment                    | reply_text                |
      | "This task needs clarification."  | "Let me explain further." |
      | "Can we use a different tool?"    | "Yes, let's try Jenkins." |

  # Alternate Flow: Reply to an already threaded reply
  Scenario Outline: Reply to an existing threaded reply
    Given the user is viewing a threaded reply to "<parent_comment>"
    When the user replies to "<reply_text>"
    Then the system should add the new reply under the existing reply, maintaining the thread structure
    And the conversation should be visible as a nested reply under the original comment

    Examples:
      | parent_comment                    | reply_text                |
      | "This task needs clarification."  | "I agree, it's confusing."|
      | "Can we use a different tool?"    | "What about Docker?"      |

  # Error Flow: Reply fails due to deleted parent comment
  Scenario Outline: Reply fails because the parent comment was deleted
    When the user replies to "<parent_comment>" with "<reply_text>"
    And "<parent_comment>" has been deleted by the original author or admin
    Then the system should display an error message: "The comment you are replying to no longer exists."
    And the user should be able to post the reply as a new top-level comment

    Examples:
      | parent_comment                    | reply_text                |
      | "This task needs clarification."  | "Let me explain further." |
      | "Can we use a different tool?"    | "Yes, let's try Jenkins." |
