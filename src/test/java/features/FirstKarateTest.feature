Feature: Welcome to Karate Framework
  Scenario: how to print
    Given print "Hello World"
    When print "B22 Welcome"
    Then print "Happ to see you again"

  Scenario: more printing
    Given print "some more words to print"
    * print "My name is","Karate Kid"
    # , is used for cancat
    * print 2+2

  Scenario: defining variable
    * def name = 'Oscar'
    * print 'my name is"+name
    * def age = 44
    * print name, 'is',age,'years old'


  Scenario: difficult parameters: json object
    * def student = { 'name':'Sam','owes_tuition':'false'}
    * print student
    * print student.name
    * print student.owes_tuition

  Scenario: json object 2
    * def student2 =
  """
      {
      "first_name":"Steven",
      "last_name":"King",
      "salary":24000
      }
      """
    * print student2.salary
    * print student2.first_name
    * print student2.last_name

  Scenario: spartan object
    * def spartan =
  """
    {
    "id": 9,
    "name": "Florrie",
    "gender": "Female",
    "phone": 1702025787
    }
    """
    * print spartan.id
    * print spartan.gender
    * print spartan.name

  @wip
  Scenario: how to reach array objects
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
      * print spartans[1].name
      * print spartans[1].phone