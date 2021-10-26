Feature: pet store api tests

  Scenario: basic test with status code
    Given url 'https://petstore.swagger.io/v2/store/inventory'
    When method GET
    Then status 200
    And print response

    Scenario: header verification
      Given url 'https://petstore.swagger.io/v2/store/inventory'
      When method GET
      Then status 200
      And match header Content-Type == 'application/json'
      And match header Connection == 'keep-alive'
      # to verify header we need to put 'header' KEYWORD and we don't need to use quotaion marks for Header type

  Scenario: body verification
    Given url 'https://petstore.swagger.io/v2/store/inventory'
    When method GET
    Then status 200
    And match response.AVAILABLE == 1
    And match response.sold == '#present'
    And match response.unavailable == '#number'




