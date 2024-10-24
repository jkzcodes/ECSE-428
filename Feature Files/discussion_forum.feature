Feature: Create Discussion Forums for Upcoming Project Events
  As a project manager or team member, I want to create discussion forums for upcoming project events where attendees
  can discuss tasks and ideas in advance, so the event feels more collaborative.

  Background:
    Given the user is logged into the platform
    And the user has created an upcoming project event

  # Normal Flow
  Scenario Outline: Successfully create a discussion forum for a project event
    When the user navigates to the project event page for "<event_name>"
    And the user clicks the "Create Discussion Forum" button
    Then the system should create a discussion forum for "<event_name>"
    And the forum should be visible to invited team members

    Examples:
      | event_name             |
      | Sprint Planning        |
      | Retrospective Meeting  |
      | Brainstorming Session  |

  # Alternate Flow: Add discussion topics to the forum
  Scenario Outline: Add discussion topics for project ideas
    Given the user has created a discussion forum for "<event_name>"
    When the user adds a discussion topic "<topic_name>" to the forum
    Then the system should add the discussion topic "<topic_name>" to the forum for "<event_name>"
    And team members should be able to comment on the topic

    Examples:
      | event_name             | topic_name                  |
      | Sprint Planning        | Task Prioritization Ideas    |
      | Brainstorming Session  | New Feature Suggestions      |

  # Error Flow: Duplicate discussion topic name
  Scenario Outline: Fail to add a duplicate discussion topic
    Given a discussion forum exists for "<event_name>"
    When the user or team member tries to add a discussion topic "<topic_name>" that already exists
    Then the system should display a message: "This discussion topic already exists."
    And the system should prevent duplicate topics from being created

    Examples:
      | event_name             | topic_name                  |
      | Sprint Planning        | Task Prioritization Ideas    |
      | Brainstorming Session  | New Feature Suggestions      |
