Feature: Upload Media
  As a user, I want to upload media files,
  so I can share images, videos, and other content with my tasks.

  Background:
    Given the user is logged into the platform
    And the user is on the task creation page

  # Normal Flow
  Scenario: Successfully upload a media file
    When the user clicks the "Upload Media" button
    And the user selects a media file from their device
    And the user clicks the "Submit" button
    Then the system should upload the media file
    And the user should see a confirmation message that the media has been uploaded
    And the media should be displayed in the task preview

  # Alternate Flow: Upload multiple media files
  Scenario: Successfully upload multiple media files
    When the user clicks the "Upload Media" button
    And the user selects multiple media files from their device
    And the user clicks the "Submit" button
    Then the system should upload all selected media files
    And the user should see a confirmation message that the media has been uploaded
    And all media files should be displayed in the task preview

  # Alternate Flow: Preview uploaded media
  Scenario: Preview uploaded media before tasking
    When the user uploads a media file
    Then the system should display a preview of the uploaded media
    And the user should be able to remove the media before submitting the task

  # Error Flow: Upload fails due to file size limit
  Scenario: Upload fails due to exceeding file size limit
    When the user clicks the "Upload Media" button
    And the user selects a media file that exceeds the maximum file size limit
    Then the system should display an error message: "File size exceeds the maximum limit."
    And the media should not be uploaded

  # Error Flow: Upload fails due to unsupported file type
  Scenario: Upload fails due to unsupported file type
    When the user clicks the "Upload Media" button
    And the user selects a media file of an unsupported type
    Then the system should display an error message: "Unsupported file type. Please upload a valid media file."
    And the media should not be uploaded
