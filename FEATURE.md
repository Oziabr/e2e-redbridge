/features/kpi.feature
```cucumber
@goodRead=http://hackersome.com/p/shazam/yadda

Feature: KPI Templates
Background:
    Given set window 1200 x 800
    Given go to http://local.globalpas.com

Scenario: Login&Setup
    Given login as test003 with password test003
    When select KPI in menu

Scenario: Creation of a new user defined KPI [Period]
    When select KPI in menu
    When push button with plus sign
     And push button [Period]
     And type, after label Template Name, value unique-testing-template-id
     And push pseudo-button Create And Remain In List
    Then not have modal
     And table have a row "unique-testing-template-id", which have value of "unique-testing-template-id [Period]"
    Then have toaster message "check"
     And header of toaster message is "Creation of new template"
     And text of toaster message "[Period] template «unique-testing-template-id» successfuly created"

Examples:
  Period
  Yearly
  Quarterly

Scenario: Unsuccessful creation of a new user defined KPI [Временной горизонт] with not unique name
    When select KPI in menu
    When push button with plus sign
     And push button [Period]
     And type, after label Template Name, value unique-testing-template-id
     And push pseudo-button Create And Remain In List
    Then modal of the kind "warning"
     And modal header "KPI of that name already defined"
     And modal text "You have to specify unique name for new KPI Template"

Examples:
  Period
  Yearly
  Quarterly

Scenario: Unsuccessful creation of a new user defined KPI [Временной горизонт] without name
    When select KPI in menu
    When push button with plus sign
     And push button [Period]
     And type, after label Template Name, value unique-testing-template-id
     And push pseudo-button Create And Remain In List
    Then modal of the kind "warning"
     And modal header "Validation error"
     And modal text "You have to provide «KPI Title»"

Examples:
  Period
  Yearly

Scenario: Deletion of the two user defined KPI
    When select KPI in menu
    When push button with "trash" sign in the row with text "unique-testing-template-id"
     And push button with "trash" sign in the row with text "unique-testing-template-id"
    Then table does not contained row with text "unique-testing-template-id"
```
