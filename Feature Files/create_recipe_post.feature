Feature: Create a post for a salad recipe
    As a registered user,
    I want to create a post for a salad recipe,
    So that other people can see the post.

    # Normal Flow
    Scenario: Successfully create a salad recipe post
        Given the user is logged in
        When the user navigates to the "Create Post" page
        And the user enters a title, description, and ingredients for the salad recipe
        And the user clicks the "Post" button
        Then the post should be created successfully
        And the post should be visible to other users

        Examples:
            | salad_recipe_id | salad_recipe_name    | username       | description                 | ingredients                  |
            | 109808907070    | THE Caesar           | saladlover123  | The best Caesar             | lettuce, crouttons, lemon    |
            | 901283091851    | Shrimp lover's salad | greens4life    | For people who like shrimps | shrimps, mayonnaise, mustard |
            | 083019278311    | Pasta, Pasta, Pasta  | balsamicfan    | Never enough Gluten         | pasta, cucumber, tomate      |

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
        And the user enters a title "<salad_dressing_name>", description "<description>", and ingredients "<ingredients>" for the salad recipe
        And the user selects a salad dressing "<salad_dressing>" to the recipe
        And the user clicks the "Post" button
        Then the post should be created successfully
        And the post should display the salad dressing

        Examples:
            | salad_recipe_id | salad_recipe_name    | username       | description                 | ingredients                  | salad_dressing_id |
            | 109808907070    | THE Caesar           | saladlover123  | The best Caesar             | lettuce, crouttons, lemon    | 102038098800      |
            | 901283091851    | Shrimp lover's salad | greens4life    | For people who like shrimps | shrimps, mayonnaise, mustard | 012380192389      |
            | 083019278311    | Pasta, Pasta, Pasta  | balsamicfan    | Never enough Gluten         | pasta, cucumber, tomate      | 123798739182      |

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