@regression
Feature: API testing on the OpenAboutUser page

  Scenario: Create user and verify user information by username

  # --- Create user ---
    Given url petBaseUrl
    And path 'user', 'createWithList'
    * def myRequestBody = read('classpath:data/postUser.json')
    And request myRequestBody
    And method POST
    And print response
    Then status 200
    Then match response.message == 'ok'
    Then match response.type == 'unknown'

  # username
    * def username = myRequestBody[0].username

  # --- Verify user ---
    Given url petBaseUrl
    And path 'user', username
    And header Accept = 'application/json'
    When method GET
    Then status 200
    Then match response.username == username
    Then match response.firstName == myRequestBody[0].firstName
    Then match response.lastName == myRequestBody[0].lastName
    Then match response.email == myRequestBody[0].email
    Then match response.phone == myRequestBody[0].phone
    Then match response.userStatus == myRequestBody[0].userStatus
