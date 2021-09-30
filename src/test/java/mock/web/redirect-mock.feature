
Feature: login service mock


Scenario: pathMatches('/login')
    * def responseHeaders = {Set-Cookie: newCookie='likeIt', 'Location': '/authorize'}
    * def responseStatus = 302
    * def response = requestHeaders

Scenario:
    # catch-all
    * def responseStatus = 200
    * def response = requestHeaders
