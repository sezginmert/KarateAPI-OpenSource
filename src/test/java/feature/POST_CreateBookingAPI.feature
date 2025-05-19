Feature: Create and Verify Booking

  Background:
    * url restfulBaseUrl
    * def requestBody = read('classpath:data/createBooking.json')

  Scenario: Create booking and verify it exists

  # --- Create Booking ---
    Given path 'booking'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request requestBody
    When method POST
    Then status 200
    * def bookingId = response.bookingid
    * def createdBooking = response.booking
    * print 'Created booking ID:', bookingId
    * print response

  # --- Verify Booking ---
    Given path 'booking', bookingId
    And header Accept = 'application/json'
    When method GET
    * print response
    Then status 200
    And match response.firstname == createdBooking.firstname
    And match response.lastname == createdBooking.lastname
    And match response.additionalneeds == createdBooking.additionalneeds

