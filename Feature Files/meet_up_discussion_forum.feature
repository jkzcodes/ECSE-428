Feature: Create Discussion Forums for Upcoming Meet-Ups
  As a user, I want to create discussion forums for upcoming meet-ups where attendees can talk about their recipe ideas in advance,
  so the event feels more collaborative.

  Background:
    Given the user is logged into the platform
    And the user has created an upcoming meet-up event

  # Normal Flow
  Scenario Outline: Successfully create a discussion forum for a meet-up
    When the user navigates to the meet-up event page for "<event_name>"
    And the user clicks the "Create Discussion Forum" button
    Then the system should create a discussion forum for "<event_name>"
    And the forum should be visible to invited attendees

    Examples:
      | event_name                 |
      | Vegan Dressings Only       |
      | Low-Calorie Dressings Meet |
      | Mediterranean Flavors Party|

  # Alternate Flow: Add discussion topics to the forum
  Scenario Outline: Add discussion topics for recipe ideas
    Given the user has created a discussion forum for "<event_name>"
    When the user adds a discussion topic "<topic_name>" to the forum
    Then the system should add the discussion topic "<topic_name>" to the forum for "<event_name>"
    And attendees should be able to comment on the topic

    Examples:
      | event_name                 | topic_name                    |
      | Vegan Dressings Only       | Best Olive Oil Substitutes     |
      | Mediterranean Flavors Party| Favorite Mediterranean Spices  |


  # Error Flow: Duplicate discussion topic name
  Scenario Outline: Fail to add a duplicate discussion topic
    Given a discussion forum exists for "<event_name>"
    When the user or attendee tries to add a discussion topic "<topic_name>" that already exists
    Then the system should display a message: "This discussion topic already exists."
    And the system should prevent duplicate topics from being created

    Examples:
      | event_name                 | topic_name                    |
      | Vegan Dressings Only       | Best Olive Oil Substitutes     |
      | Mediterranean Flavors Party| Favorite Mediterranean Spices  |

