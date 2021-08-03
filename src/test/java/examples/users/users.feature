Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  # See logs. Using multiple cookie headers breaks spec and will not work with many services, e.g. Okta
  #Actual:
  #1 > GET https://jsonplaceholder.typicode.com/users
  #1 > Cookie: bar=Bar
  #1 > Cookie: foo=Foo
  #1 > Host: jsonplaceholder.typicode.com
  #1 > Connection: Keep-Alive
  #1 > User-Agent: Apache-HttpClient/4.5.13 (Java/1.8.0_201)
  #1 > Accept-Encoding: gzip,deflate

  #Expected:
  #1 > GET https://jsonplaceholder.typicode.com/users
  #1 > Cookie: bar=Bar; foo=Foo
  #1 > Host: jsonplaceholder.typicode.com
  #1 > Connection: Keep-Alive
  #1 > User-Agent: Apache-HttpClient/4.5.13 (Java/1.8.0_201)
  #1 > Accept-Encoding: gzip,deflate
  Scenario: Multiple cookie headers must be combined into single header per rfc6265 https://datatracker.ietf.org/doc/html/rfc6265#section-5.4
    Given path 'users'
    And cookie foo = 'Foo'
    And cookie bar = 'Bar'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'users', first.id
    When method get
    Then status 200