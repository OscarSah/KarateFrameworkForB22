Feature: Karate browser automation

  Background:
    * configure driver = { type: 'chrome', executable: 'C:/Program Files/Google/Chrome/Application/chrome.exe' }
  Scenario: try to do a google search

    Given driver 'https://google.com'
    And input("input[name=q]", 'karate dsl')
    When submit().click("input[name=btnI]")
    Then waitForUrl('https://github.com/intuit/karate')

  @wip

  Scenario: try to login to bookIt
    Given driver 'https://cybertek-reservation-qa3.herokuapp.com/sign-in'
    * maximize()
    And input("input[name='email']",'sbirdbj@fc2.com')
    And input("input[name='password']",'asenorval')
    When submit().click("button[type='submit']")
    And retry(5,15000).waitForUrl('https://cybertek-reservation-qa3.herokuapp.com/map')
    Then match driver.url == 'https://cybertek-reservation-qa3.herokuapp.com/map'