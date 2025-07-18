Feature: Restfull API Create Token

  Scenario: Create Token
    Given url restfulBaseUrl
    And path 'auth'
    And header Content-Type = 'application/json'
    * def requestBody = read('classpath:data/token.json')
    And request requestBody
    And method POST
    And print response
    Then status 200
    Then status 200