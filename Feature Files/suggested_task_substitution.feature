Feature: Suggested Task Substitutions
  As a project manager or team member, I want to see suggested task substitutions (e.g., a different tool or approach), so I can modify tasks to suit the project’s needs or team preferences.

  Background:
    Given the user is logged into the platform
    And the user is viewing a task with potential actions or tools they may want to substitute

  # Normal Flow
  Scenario Outline: Successfully view suggested task substitutions
    When the user clicks on a task "<task_action>" in the project board
    Then the system should display a list of suggested substitutions for "<task_action>"
    And the user should be able to choose one to update the task

    Examples:
      | task_action        |
      | use Python script  |
      | manual data entry  |
      | deploy via Jenkins |

  # Alternate Flow: User selects a preferred tool or method filter
  Scenario Outline: View task substitutions based on preferred tools or methods
    Given the user has selected "<preference>" as their preferred tool or method
    When the user clicks on "<task_action>" in the project board
    Then the system should display substitutions that align with "<preference>"
    And the user should be able to apply a substitute that meets the project or team preference

    Examples:
      | preference     | task_action       |
      | automated      | manual testing    |
      | cloud-based    | on-premise server |
      | agile          | waterfall method  |

  # Alternate Flow: View substitution suggestions based on team member skillsets
  Scenario Outline: View task substitutions based on team member skills
    Given the user has indicated that a team member is proficient in "<skill>"
    When the user clicks on "<task_action>" that requires "<skill>"
    Then the system should automatically suggest alternatives or adjustments that match "<skill>"
    And the user should be able to assign the task to the team member or modify the task based on the skillset

    Examples:
      | skill          | task_action         |
      | Python         | script automation   |
      | React          | frontend development|

  # Error Flow: No substitutions available for the selected task action
  Scenario Outline: No available substitutions for a selected task action
    When the user clicks on "<task_action>" in the project board
    And there are no available substitutions for "<task_action>"
    Then the system should display a message: "No substitutions available for this task."
    And the user should be prompted to search for other ideas or manually edit the task

    Examples:
      | task_action       |
      | proprietary tool  |
      | legacy system     |

  # Error Flow: User tries to substitute a critical task or tool
  Scenario Outline: Substitution attempt for a critical task or tool
    When the user tries to substitute "<critical_task>"
    And "<critical_task>" is essential for the success of the project
    Then the system should display a message: "This task or tool is essential for the project. Substituting it may affect the final outcome."
    And the user should be allowed to proceed but with a warning

    Examples:
      | critical_task    |
      | security audit   |
      | database backup  |
