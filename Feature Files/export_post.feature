
Feature: Export Post as a PDF
    As a registered user,
    I want to export a post as a PDF,
    So that I can print the ingredients and recipe in a nice pretty format.

    # Normal Flow: Export a post as a PDF
    Scenario: User successfully exports a post as a PDF
        Given the user is logged in
        And the user has selected a post
        When the user clicks on the "Export as PDF" button
        Then the system generates a PDF file of the selected post
        And the PDF is automatically downloaded to the user's device

    # Alternate Flow: Export a post as a PDF without being logged in
    Scenario: User tries to export a post as a PDF without being logged in
        Given the user is not logged in
        When the user clicks on the "Export as PDF" button
        Then the system redirects the user to the login page
        And the user is prompted to log in to export the recipe as a PDF

    # Error Flow: Export a post as a PDF when there is a system error
    Scenario: System error occurs while exporting a post as a PDF
        Given the user is logged in
        And the user has selected a post
        When the user clicks on the "Export as PDF" button
        And a system error occurs
        Then the system displays an error message "Unable to export the recipe as PDF. Please try again later."
        And the user remains on the post page