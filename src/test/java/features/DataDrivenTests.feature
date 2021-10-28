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


  @wip
  Scenario: get user information from DataBase and verify with API (2 point)

  # Get information from Database
  * def DBUtils = Java.type('utilities.DBUtils')
  * def query = "select firstname, lastname, role from users where email = 'sbirdbj@fc2.com'"
  * def dbResult = DBUtils.getRowMap(query)
  * print 'DATABASE RESULT',dbResult

  # get bearer token for API
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'sbirdbj@fc2.com'
    And param password = "asenorval"
    When method get
    Then status 200
    And print response
    And def token = response.accessToken

    # Get student info
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com/'
    And path 'api/students/me'
    And header Authorization = 'Bearer ' + token
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    And match response.firstName == dbResult.firstname
    And match response.lastName == dbResult.lastname
    And match response.role == dbResult.role

