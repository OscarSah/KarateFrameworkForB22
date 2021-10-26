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
  @wip

  Scenario: difficult parameters: json object
    * def student = { 'name':'Sam','owes_tuition':'false'}
    * print student
    * print student.name
    * print student.owes_tuition