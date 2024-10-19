Feature: Create a post for a salad dressing
    As a registered user,
    I want to create a post for a salad dressing,
    So that other people can see the post.

    # Normal Flow
    Scenario: Successfully create a salad dressing post
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user enters a title "<salad_dressing_name>", description "<description>", and ingredients "<ingredients>" for the salad dressing
        And the user clicks the "Post" button
        Then the post should be created successfully
        And the post should be visible to other users

        Examples:
            | salad_dressing_name       | description       | ingredients             |
            | Ranch (the best)          | Creamy ranch      | buttermilk, mayo, herbs |
            | Mustard Honey Vinaigrette | Tangy vinaigrette | mustard, honey, vinegar |
            | Balsamic Glaze            | Sweet and tangy   | balsamic vinegar, sugar |

    # Alternate Flow: Cancel Post Creation
    Scenario: Cancel creating a salad dressing post
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user decides not to create a post
        Then the user should be redirected to the home page

    # Alternate Flow: Add a picture to the post
    Scenario: Add a picture to the salad dressing post
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user enters a title "<salad_dressing_name>", description "<description>", and ingredients "<ingredients>" for the salad dressing
        And the user uploads a picture, which is referenced by its id "<picture_id>" for the post
        And the user clicks the "Post" button
        Then the post should be created successfully
        And the post should display the uploaded picture

        Examples:
            | salad_dressing_name       | description       | ingredients             | picture_id   |
            | Ranch (the best)          | Creamy ranch      | buttermilk, mayo, herbs | 361726512356 |
            | Mustard Honey Vinaigrette | Tangy vinaigrette | mustard, honey, vinegar | 563645876468 |
            | Balsamic Glaze            | Sweet and tangy   | balsamic vinegar, sugar | 123576348714 |

    # Error Flow: Missing Details
    Scenario: Create a post with missing title
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user enters a description and ingredients but leaves the title blank
        And the user clicks the "Post" button
        Then the post should not be created
        And the user should see an error message indicating that the title is required

    # Error Flow: Missing Ingredients
    Scenario: Create a post with missing ingredients
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user enters a title and description but leaves the ingredients blank
        And the user clicks the "Post" button
        Then the post should not be created
        And the user should see an error message indicating that the ingredients are required