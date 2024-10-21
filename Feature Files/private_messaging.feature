Feature: Private Messaging
  As a user, I want to send private messages to other users,
  so I can communicate directly without others seeing the conversation.

  Background:
    Given the user is logged into the platform
    And the user is on the messaging page

  # Normal Flow
  Scenario: Successfully send a private message
    When the user selects a recipient from the contacts list
    And the user types a message in the message input field
    And the user clicks the "Send" button
    Then the system should send the message to the recipient
    And the user should see the sent message in the chat window
    And the recipient should receive a notification of the new message

  # Alternate Flow: Reply to a received message
  Scenario: Successfully reply to a received private message
    Given the user has received a private message from another user
    When the user clicks on the conversation
    And the user types a reply in the message input field
    And the user clicks the "Send" button
    Then the system should send the reply to the other user
    And the user should see the reply in the chat window

  # Alternate Flow: Attach media to a message
  Scenario: Successfully send a media attachment
    When the user selects a recipient
    And the user attaches a media file to the message
    And the user clicks the "Send" button
    Then the system should send the media file to the recipient
    And the user should see the media attachment in the chat window

  # Error Flow: Sending message fails due to network issue
  Scenario: Sending message fails due to network connection issue
    When the user clicks "Send" after typing a message
    And there is a network connection issue
    Then the system should display an error message: "Unable to send the message. Please check your connection and try again."
    And the message should remain in the input field

  # Error Flow: Attempt to send an empty message
  Scenario: User attempts to send an empty message
    When the user selects a recipient
    And the user leaves the message input field empty
    Then the system should display an error message: "Message cannot be empty."
    And the message should not be sent
