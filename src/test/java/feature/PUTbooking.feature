@smoke
Feature: Update an existing booking partially using PUT method

  Background:
    # Using static token since token generation is not implemented separately
    * def myToken = 'Basic YWRtaW46cGFzc3dvcmQxMjM='

  Scenario: Successfully update an existing booking using a valid token

    Given url restfulBaseUrl
    And path 'booking', 10
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Authorization = myToken

    # Read base request body from JSON file
    * def myRequestBody = read('classpath:data/update.json')

    # Generate dynamic values
    * def randomFirstName = 'Jack_' + Math.floor(Math.random() * 1000)
    * def randomLastName = 'Sparrow_' + Math.floor(Math.random() * 1000)
    * def randomPrice = 50 + Math.floor(Math.random() * 100)
    * def randomDeposit = Math.random() < 0.5 ? true : false
    * def needsList = ['Breakfast', 'Lunch', 'Late Checkout', 'Wi-Fi']
    * def randomNeed = needsList[Math.floor(Math.random() * needsList.length)]

    # Set static dates
    * def checkin = '2025-05-20'
    * def checkout = '2025-05-23'

    # Update request body with dynamic and static values
    * set myRequestBody.firstname = randomFirstName
    * set myRequestBody.lastname = randomLastName
    * set myRequestBody.totalprice = randomPrice
    * set myRequestBody.depositpaid = randomDeposit
    * set myRequestBody.bookingdates.checkin = checkin
    * set myRequestBody.bookingdates.checkout = checkout
    * set myRequestBody.additionalneeds = randomNeed

    # Send PUT request
    And request myRequestBody
    When method PUT
    Then status 200
    * print response

    # Validate response matches updated request
    Then match response.firstname == myRequestBody.firstname
    Then match response.lastname == myRequestBody.lastname
    Then match response.totalprice == myRequestBody.totalprice
    Then match response.additionalneeds == myRequestBody.additionalneeds
