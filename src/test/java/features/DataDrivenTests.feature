Feature: Data driven tests
  Scenario Outline: get token for user
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = "<password>"
    When method get
    Then status 200
    And print response
    And def token = response.accessToken
    * print token
    Examples:
  | email                       | password       |
  | sbirdbj@fc2.com             | asenorval      |
  | mnewbatt8o@utexas.edu       | opalcave       |
  | wamiss8p@businesswire.com   | olagrills      |
  | mstacey8r@imdb.com          | skylargiblin   |
  | ecrasford8s@dagondesign.com | bricesiddell   |
  | gwilloway8t@nih.gov         | morrievondrach |



  @wip

  Scenario Outline: get token for user with CSV file
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = "<password>"
    When method get
    Then status 200
    And print response
    And def token = response.accessToken
    * print token
    Examples:
    | read ('data/users.csv')|