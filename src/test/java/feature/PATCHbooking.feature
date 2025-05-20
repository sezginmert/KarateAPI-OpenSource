Feature: Update an existing booking partially using PUT method

  Background:
    ## "Since I am using a RESTful API, I did not implement token retrieval via a createToken process
    * def myToken = 'Basic YWRtaW46cGFzc3dvcmQxMjM='

  Scenario: Successfully update an existing booking using valid token

    # Dinamic firstname ve totalprice
    * def randomFirstName = 'Jack_' + Math.floor(Math.random() * 1000)
    * def randomPrice = 15 + Math.floor(Math.random() * 100)

    # JSON body
    * def myRequestBody =
    """
    {
      "firstname": "#(randomFirstName)",
      "lastname": "Sparrow",
      "totalprice": #(randomPrice),
      "depositpaid": true,
      "bookingdates": {
        "checkin": "2025-06-20",
        "checkout": "2025-06-25"
      },
      "additionalneeds": "Breakfast"
    }
    """

    Given url restfulBaseUrl
    And path 'booking', 10
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Authorization = myToken
    And request myRequestBody
    When method PUT
    Then status 200
    * print response

    # Verify
    Then match response.firstname == myRequestBody.firstname
    Then match response.lastname == myRequestBody.lastname
    Then match response.totalprice == myRequestBody.totalprice
    Then match response.additionalneeds == myRequestBody.additionalneeds
