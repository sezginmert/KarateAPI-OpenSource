Feature: Retrieve fuel prices from the Fuel API

  Background:
    * def token = '18Pj6PvAsp6HajgcjsxVAa:3KHSpVlF1gvdPM0Ryz6v0o'
    Given url fuelBaseUrl
    And path 'gasPrice','turkeyDiesel'
    And header Authorization = 'apikey ' + token
    And header content-type = 'application/json'

  Scenario: Get current fuel prices for a specific city

    And param city = 'istanbul'
    And param district = 'kadikoy'
    When method GET
    And print response
    Then status 200

  Scenario:  Diesel price is 47.3 TL for Opet in Seferihisar, Izmir

    And params { city: 'izmir', district: 'seferihisar' }
    When method GET
    And print response
    Then match response.result[8].dizel == 47.3
    Then status 200

  Scenario: Diesel price is 46.94 TL for Petrol Ofisi in Cankaya, Ankara

    And params { city: 'ankara', district: 'cankaya' }
    When method GET
    Then status 200
    And  print response
    * def poDiesel = response.result.filter(x => x.marka == 'Petrol Ofisi')[0].dizel
    Then match poDiesel == 46.94




