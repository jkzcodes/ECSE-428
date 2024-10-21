Feature: Report Post
  As a user, I want to report inappropriate posts,
  so the platform can take action to remove or review content that violates guidelines.
  
  Background:
    Given the user is logged into the platform
    And the user is viewing a post they believe violates guidelines
    
  # Normal Flow
  Scenario: Successfully report a post
    When the user clicks on the "Report Post" button
    And the user selects a reason for reporting the post
    Then the system should send the report for review
    And the user should see a confirmation message that the post has been reported
  
  # Alternate Flow: Report post without selecting a reason
  Scenario: User attempts to report a post without selecting a reason
    When the user clicks the "Report Post" button
    And the user does not select a reason for reporting
    Then the system should display an error message: "Please select a reason to report the post."
    And the report should not be submitted
    
  # Alternate Flow: Post already reported
  Scenario: User tries to report a post they have already reported
    Given the user has previously reported the same post
    When the user clicks on the "Report Post" button again
    Then the system should display a message indicating the post has already been reported
    And no duplicate report should be sent
  
  # Error Flow: Reporting fails due to network issue
  Scenario: Reporting fails due to network connection issue
    When the user clicks "Report Post"
    And there is a network connection issue
    Then the system should display an error message: "Unable to report the post. Please check your connection and try again."
    And the user should remain on the post page
  
  # Error Flow: Reporting fails due to post being removed
  Scenario: User tries to report a post that has already been removed
    When the user clicks the "Report Post" button
    And the post has been removed by the time the report is processed
    Then the system should display a message: "This post has already been removed."
    And no report should be submitted
