---
name: Agile User Story template
about: An issue template formatted as an Agile User Story.
---

# [Story summary]

<!--- https://www.atlassian.com/agile/project-management/user-stories -->
<!--- https://sprint.ly/blog/agile-user-stories/ -->

_As a_ [person].

_I want_ [something].

_So that_ [action].

## Tech Details

- TBD
- TBD

## Acceptance Criteria

- [ ] TBD
- [ ] TBD

### Tests for Behavior-Driven Development (BDD)

<!--- Describe all scenarios that test/validated your [action]. -->
<!--- This uses Gherkin syntax, common used form Cucumber-based testing. -->
<!--- https://cucumber.io/docs/gherkin/reference/ -->

```gherkin
Scenario: Title
  Given [context]
    And [some more context]...
  When  [event]
    And [another event]...
  Then  [outcome]
    And [another outcome]...
  But   [not this outcome]
```
