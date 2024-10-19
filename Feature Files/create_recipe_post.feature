Feature: Create a post for a salad recipe
    As a registered user,
    I want to create a post for a salad recipe,
    So that other people can see the post.

    # Normal Flow
    Scenario: Successfully create a salad recipe post
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user enters a title "<salad_recipe_name>", description "<description>", and ingredients "<ingredients>" for the salad recipe
        And the user clicks the "Post" button
        Then the post should be created successfully
        And the post should be visible to other users

        Examples:
            | salad_recipe_name    | description                 | ingredients                  |
            | THE Caesar           | The best Caesar             | lettuce, crouttons, lemon    |
            | Shrimp lover's salad | For people who like shrimps | shrimps, mayonnaise, mustard |
            | Pasta, Pasta, Pasta  | Never enough Gluten         | pasta, cucumber, tomate      |

    # Alternate Flow: Cancel Post Creation
    Scenario: Cancel creating a salad recipe post
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user decides not to create a post
        Then the user should be redirected to the home page

    # Alternate Flow: Add a picture to the post
    Scenario: Add a picture to the salad recipe post
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user enters a title, description, and ingredients for the salad recipe
        And the user uploads a picture for the post
        And the user clicks the "Post" button
        Then the post should be created successfully
        And the post should display the uploaded picture

    # Alternate Flow: Add a salad dressing to the recipe
    Scenario: Add a salad dressing to the salad recipe post
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user enters a title "<salad_recipe_name>", description "<description>", and ingredients "<ingredients>" for the salad recipe
        And the user selects a salad dressing "<salad_dressing>" to the recipe
        And the user clicks the "Post" button
        Then the post should be created successfully
        And the post should display the salad dressing

        Examples:
            | salad_recipe_name    | description                 | ingredients                  | salad_dressing  |
            | THE Caesar           | The best Caesar             | lettuce, crouttons, lemon    | Caesar dressing |
            | Shrimp lover's salad | For people who like shrimps | shrimps, mayonnaise, mustard | Marinara        |
            | Pasta, Pasta, Pasta  | Never enough Gluten         | pasta, cucumber, tomate      | Pesto           |

    # Error Flow: Missing Details
    Scenario: Create a post with missing title
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user enters a description "<description>" and ingredients "<ingredients>" but leaves the title blank
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