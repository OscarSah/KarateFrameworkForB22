Feature: get user token

  Scenario: get one user token
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'sbirdbj@fc2.com'
    And param password = "asenorval"
    When method get
    Then status 200
    And print response
    And def token = response.accessToken
    