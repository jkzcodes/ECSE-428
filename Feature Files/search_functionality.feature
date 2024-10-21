Feature: Search Functionality
  As a user, I want to search for posts, users, or hashtags,
  so I can quickly find relevant content on the platform.
  
  Background:
    Given the user is logged into the platform
    And the user is on the main feed page
    
  # Normal Flow
  Scenario: Successfully search for content
    When the user enters a search term in the search bar
    And the user clicks on the "Search" button
    Then the system should display matching posts, users, or hashtags
    And the search results should be relevant to the entered term
  
  # Alternate Flow: No matching results
    Scenario: Search term yields no results
    When the user enters a search term with no matching content
    Then the system should display a message: "No results found."
    And the user should remain on the search results page
    
  # Alternate Flow: Search suggestion
  Scenario: Search term partially matches content
    When the user enters a partial search term
    Then the system should display auto-suggestions for related posts, users, or hashtags
    And the user should be able to select from the suggestions
    
  # Error Flow: Search bar empty
  Scenario: Attempt to search with an empty search bar
    When the user clicks on the "Search" button with no search term entered
    Then the system should display a message: "Please enter a search term."
    And the search should not be initiated
  
  # Error Flow: Search fails due to network issue
  Scenario: Search functionality fails due to network connection issue
    When the user clicks on the "Search" button
    And there is a network connection issue
    Then the system should display an error message: "Unable to search. Please check your connection and try again."
    And the user should remain on the same page with the search term intact
