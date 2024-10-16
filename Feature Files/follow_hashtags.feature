Feature: Follow Specific Hashtags
  As a user, I want to follow specific hashtags (e.g., #balsamic, #lowcarb),
  so I can see posts and recipes related to my interests.

  Background:
    Given the user is logged into the platform
    And the user is viewing a hashtag page they are interested in following

  # Normal Flow
  Scenario: Successfully follow a hashtag
    When the user clicks on the "Follow" button for the hashtag
    Then the system should confirm that the user is now following the hashtag
    And the hashtag’s posts and recipes should appear in the user’s feed
    And the user should receive notifications about new content with the hashtag

  # Alternate Flow: Already following the hashtag
  Scenario: Try to follow a hashtag the user is already following
    Given the user is already following the hashtag
    When the user clicks on the "Follow" button again
    Then the system should display a message indicating that the user is already following the hashtag
    And no duplicate follow action should be performed
    And the "Follow" button should be replaced with an "Unfollow" option
    And the user should see an option to manage notification preferences for the hashtag

  # Alternate Flow: Hashtag not found
  Scenario Outline: Hashtag not found when attempting to follow
    Given the user is searching for a hashtag
    When the user tries to follow the hashtag "<hashtag>"
    Then the system should display a message indicating "Hashtag not found"
    And the "Follow" button should be disabled for non-existent hashtags
    And the user should be prompted to search for other hashtags or create their own

    Examples:
      | hashtag              |
      | #randomnonexistent   |
      | #invalidhashtagentry |

  # Alternate Flow: Unfollow a hashtag
  Scenario: Unfollow a hashtag
    Given the user is following the hashtag
    When the user clicks on the "Unfollow" button for the hashtag
    Then the system should confirm that the user has unfollowed the hashtag
    And the hashtag’s posts and recipes should be removed from the user’s feed
    And the user should stop receiving notifications about new content with the hashtag

  # Error Flow: Hashtag flagged for inappropriate content
  Scenario Outline: Follow hashtag fails due to hashtag flagged for inappropriate content
    When the user tries to follow the hashtag "<flagged_hashtag>"
    Then the system should display a message: "This hashtag has been flagged for inappropriate content and cannot be followed."
    And the "Follow" button should be disabled
    And the user should be provided an option to report if they believe the flagging is an error

    Examples:
      | flagged_hashtag      |
      | #inappropriate       |
      | #offensivetag        |