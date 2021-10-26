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

  Scenario: Fuzzy matching
    * def spartan =
  """
      {
    "id": 9,
    "name": "Florrie",
    "gender": "Female",
    "phone": 1702025787,
    "active": true
       }
      """
    * match spartan.id == '#number'
    * match spartan.name == '#string'
    * match spartan.phone == '#present'
    * match spartan.lastName == '#notpresent'
    * match spartan.active == "#boolean"
  @wip

  Scenario: contains matching
    * def spartans =
    """
       [
        {
            "id": 39,
            "name": "Eveleen",
            "gender": "Female",
            "phone": 1362642898
        },
        {
            "id": 465,
            "name": "Lavern",
            "gender": "Female",
            "phone": 12533732417
        },
        {
            "id": 587,
            "name": "Everett",
            "gender": "Female",
            "phone": 9029908717
        }
    ]
      """
    * def length = spartans.length
    * match length == 3
    * match spartans contains {  "id": 39,  "name": "Eveleen",  "gender": "Female",  "phone": 1362642898 }
    # contains any: To assert that any of the given array elements are present
    * def items = { item : [1, 2, 3] }
    * match items.item contains any [9, 2, 8]
    # contains each method:
    * def data = { foo: [{ bar: 1, baz: 'a' }, { bar: 2, baz: 'b' }, { bar: 3 , baz: 'c' }]}
    * match each data.foo == { bar: '#number', baz: '#string' }