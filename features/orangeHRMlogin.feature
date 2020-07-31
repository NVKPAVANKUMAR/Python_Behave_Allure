Feature: OrangeHRM Logo

  @smoke
  Scenario: Logo presence on OrangeHRM home page
    Given launch chrome browser
    When open orange hrm homepage
    Then verify that the logo present on page
    And Close browser

  @regression
  Scenario: Logo presence on OrangeHRM home page
    Given launch chrome browser
    When open orange hrm homepage
    Then verify that the logo present on page
    And Close browser