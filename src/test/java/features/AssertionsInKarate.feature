Feature: Assertions
  Scenario: some matching examples
    * def name = "Severus Snape"
    * match name == "Severus Snape"
    # similar to Assert.assertEquals(name,"Severus Snape")
    * match name != "Tom Hanks"

  Scenario: more matching with JSON object
    * def spartan =
  """
      {
    "id": 9,
    "name": "Florrie",
    "gender": "Female",
    "phone": 1702025787
       }
      """
    * def spartan_name = spartan.name
    * match spartan_name == 'Florrie'
    * match spartan.gender == 'Female'
    * match spartan.phone == 1702025787
  @wip
  Scenario:
