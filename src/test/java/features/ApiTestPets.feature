Feature: pet store api tests

  Scenario: basic test with status code
    Given url 'https://petstore.swagger.io/v2/store/inventory'
    When method GET
    Then status 200
    And print response