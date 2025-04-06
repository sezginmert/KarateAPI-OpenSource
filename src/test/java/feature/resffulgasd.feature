Feature: resffulGetBookingIds kısmının karate framework ile test edilmesi

  Scenario: GET'ile sorgu çalıştırması
    Given url  restfulBaseUrl
    When path 'booking'
    When method GET
    * print response
    Then status 200
