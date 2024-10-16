Feature: Suggested Ingredient Substitutions
  As a user, I want to see suggested ingredient substitutions (e.g., olive oil instead of avocado oil),
  so I can modify recipes to suit my preferences or dietary needs.

  Background:
    Given the user is logged into the platform
    And the user is viewing a recipe with ingredients they may want to substitute

  # Normal Flow
  Scenario Outline: Successfully view suggested ingredient substitutions
    When the user clicks on an ingredient "<ingredient>" in the recipe
    Then the system should display a list of suggested substitutions for "<ingredient>"
    And the user should be able to choose one to update the recipe

    Examples:
      | ingredient        |
      | avocado oil       |
      | honey             |
      | flour             |

  # Alternate Flow: User selects a dietary preference filter
  Scenario Outline: View ingredient substitutions based on dietary preferences
    Given the user has selected "<diet_preference>" as their dietary preference
    When the user clicks on "<ingredient>" in the recipe
    Then the system should display substitutions that align with "<diet_preference>"
    And the user should be able to apply a substitute that meets the dietary requirement

    Examples:
      | diet_preference  | ingredient     |
      | vegan            | honey          |
      | gluten-free      | flour          |
      | low-carb         | sugar          |

  # Alternate Flow: View substitution suggestions based on user’s allergies
  Scenario Outline: View ingredient substitutions based on user allergies
    Given the user has indicated they are allergic to "<allergy>"
    When the user clicks on "<ingredient>" that contains "<allergy>"
    Then the system should automatically suggest allergen-free alternatives for "<ingredient>"
    And the user should be able to choose an alternative to update the recipe

    Examples:
      | allergy     | ingredient    |
      | peanuts     | peanut butter |
      | dairy       | milk          |

  # Error Flow: No substitutions available for the selected ingredient
  Scenario Outline: No available substitutions for a selected ingredient
    When the user clicks on "<ingredient>" in the recipe
    And there are no available substitutions for "<ingredient>"
    Then the system should display a message: "No substitutions available for this ingredient."
    And the user should be prompted to search for other substitution ideas or manually edit the recipe

    Examples:
      | ingredient        |
      | saffron           |
      | truffle oil       |

  # Error Flow: User tries to substitute an ingredient that is essential to the recipe
  Scenario Outline: Substitution attempt for an essential ingredient
    When the user tries to substitute "<essential_ingredient>"
    And "<essential_ingredient>" is essential for the success of the recipe
    Then the system should display a message: "This ingredient is essential for the recipe. Substituting it may affect the final result."
    And the user should be allowed to proceed but with a warning

    Examples:
      | essential_ingredient |
      | baking powder        |
      | yeast                |