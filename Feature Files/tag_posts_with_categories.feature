Feature: Tag Posts with Categories
  As a user, I want to tag my posts with categories,
  so I can better organize and find relevant content.
  
  Background:
    Given the user is logged into the platform
    And the user is on the post creation page
  
  # Normal Flow
  Scenario: Successfully tag a post with categories
    When the user selects categories from the list
    And the user submits the post
    Then the system should display the selected categories on the post
    And the post should be listed under the chosen categories
  
  # Alternate Flow: No categories selected
  Scenario: Post without categories
    Given the user did not select any categories
    When the user submits the post
    Then the system should publish the post without any categories
    And the post should be visible in the general feed
  
  # Alternate Flow: Exceeding category limit
  Scenario: User attempts to select more than the allowed number of categories
    When the user selects more than 3 categories
    Then the system should display an error message: "You can only select up to 3 categories."
    And the post should not be submitted
  
  # Error Flow: Category selection fails due to network issue
  Scenario: Tagging categories fails due to network connection issue
    When the user clicks "Submit"
    And there is a network connection issue
    Then the system should display an error message: "Unable to save categories. Please check your connection and try again."
    And the user should remain on the post creation page with the selected categories intact

