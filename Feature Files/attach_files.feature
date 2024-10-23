Feature: Attach a file to a Kanban task
    As a team member,
    I want to attach a file to a Kanban task,
    So that other users can see and download the attachment.

    # Normal Flow
    Scenario: Successfully attach a file to a Kanban task
        Given the user is logged in
        And the user navigates to the Kanban board
        When the user selects a task
        And the user uploads a file "<file_name>"
        And the user clicks the "Attach" button
        Then the file should be attached to the task successfully
        And the file should be visible to other users

        Examples:
            | file_name         |
            | design_doc.pdf    |
            | requirements.docx |
            | mockup.png        |

    # Alternate Flow: Cancel file attachment
    Scenario: Cancel attaching a file to a Kanban task
        Given the user is logged in
        And the user navigates to the Kanban board
        When the user selects a task
        And the user decides not to attach a file
        Then the user should be redirected to the Kanban board without attaching the file

    # Alternate Flow: Attach multiple files to a task
    Scenario: Attach multiple files to a Kanban task
        Given the user is logged in
        And the user navigates to the Kanban board
        When the user selects a task
        And the user uploads multiple files "<file_name_1>", "<file_name_2>"
        And the user clicks the "Attach" button
        Then the files should be attached to the task successfully
        And the files should be visible to other users

        Examples:
            | file_name_1       | file_name_2       |
            | design_doc.pdf    | requirements.docx |
            | mockup.png        | wireframe.jpg     |
            | notes.txt         | summary.pdf       |

    # Error Flow: Missing file
    Scenario: Attach a file without selecting a file
        Given the user is logged in
        And the user navigates to the Kanban board
        When the user selects a task
        And the user clicks the "Attach" button without selecting a file
        Then the file should not be attached
        And the user should see an error message indicating that a file is required

    # Error Flow: Unsupported file type
    Scenario: Attach an unsupported file type to a Kanban task
        Given the user is logged in
        And the user navigates to the Kanban board
        When the user selects a task
        And the user uploads a file "<file_name>" with an unsupported file type
        And the user clicks the "Attach" button
        Then the file should not be attached
        And the user should see an error message indicating that the file type is not supported

        Examples:
            | file_name       |
            | script.exe      |
            | archive.zip     |
            | executable.bat  |