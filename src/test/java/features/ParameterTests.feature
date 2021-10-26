Feature: Parameters Example

  Background:
    * def petUrl = 'https://petstore.swagger.io/v2/store'
    * def spartanUrl = 'http://52.207.61.129:8000'

  Scenario: path parameter example
    Given url petUrl
    And path 'inventory'
    When method get
    Then status 200

  Scenario: get all spartan with path
    Given url spartanUrl
    And path "api/spartans"
    When method get
    Then status 200
    And print response

