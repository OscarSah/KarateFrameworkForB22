Feature: Karate and JAVA Integration

  Background:
    * def spartanUrl = 'http://52.207.61.129:8000'


  Scenario: Create a new Spartan
    Given url spartanUrl
    And path 'api/spartans'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request 
    """
    {
            "name": "Everettio",
            "gender": "Male",
            "phone": 9029908717
        }
    """
   When method post
   Then status 201
    And print response

    Scenario: Create a spartan with RandomData from JAVA code
      * def SDG = Java.type('utilities.SpartanDataGenerator')
      * def newSpartan = SDG.createSpartan()
      Given url spartanUrl
      And path 'api/spartans'
      And header Accept = 'application/json'
      And header Content-Type = 'application/json'
      And request newSpartan
      When method post
      Then status 201
      And match response.success == "A Spartan is Born!"


  Scenario: Create a spartan with RandomData from JAVA code and DELETE
    * def newSpartan = Java.type('utilities.SpartanDataGenerator').createSpartan()
    Given url spartanUrl
    And path 'api/spartans'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    # From JAVA file to Json : serilization
    When method post
    Then status 201
    And match response.success == "A Spartan is Born!"
    * def idToDelete = response.data.id
    Given url spartanUrl
    And path 'api/spartans',idToDelete
    When method DELETE
    Then status 204

