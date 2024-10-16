Feature: Add Friends to Network
  As a user, I want to add friends to my network,
  so I can share and discover salad dressing recipes within my circle.

  Background:
    Given the user is logged into the platform
    And the user is on the profile page of another user they want to add as a friend

  # Normal Flow
  Scenario: Successfully send a friend request
    When the user clicks on the "Add Friend" button
    Then the system should send a friend request to the other user
    And the user should see a confirmation that the friend request has been sent
    And the user should be able to view the status of the friend request

  # Alternate Flow: Friend request already sent
  Scenario: Try to add a user who already has a pending friend request
    Given the user has already sent a friend request to the same person
    When the user clicks on the "Add Friend" button again
    Then the system should display a message indicating that a friend request is already pending
    And no duplicate friend request should be sent
    And the "Add Friend" button should be replaced with an option to "Cancel Request"

  # Alternate Flow: Accept a friend request
  Scenario: Accept a pending friend request
    Given the user has received a friend request from another user
    When the user clicks on the "Accept" button for the friend request
    Then the system should confirm that the friend request has been accepted
    And the user should see the new friend in their network
    And the user should be able to share and discover salad dressing recipes with that friend

  # Error Flow: Friend request fails due to network connection issue
  Scenario: Friend request fails due to network connection issue
    When the user clicks on the "Add Friend" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to send friend request. Please check your internet connection and try again."
    And the user should remain on the same page with the "Add Friend" button still available

  # Error Flow: Friend request fails due to maximum number of friends reached
  Scenario: Friend request fails due to reaching the maximum number of friends
    Given the user has reached the maximum allowed number of friends
    When the user tries to add another friend
    Then the system should display an error message: "You have reached the maximum number of friends you can add. Remove a friend to add more friends."
    And the user should remain on the same page with the option to manage their friends