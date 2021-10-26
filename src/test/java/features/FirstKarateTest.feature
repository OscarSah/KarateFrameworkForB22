Feature: Welcome to Karate Framework
  Scenario: how to print
    Given print "Hello World"
    When print "B22 Welcome"
    Then print "Happ to see you again"

  @wip
  Scenario: more printing
    Given print "some more words to print"
    * print "My name is","Karate Kid"
    # , is used for cancat
    * print 2+2