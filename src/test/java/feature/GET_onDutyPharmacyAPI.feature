Feature: Retrieve on-duty pharmacies from the Pharmacy on Duty API

  Background:
    * def token = '18Pj6PvAsp6HajgcjsxVAa:3KHSpVlF1gvdPM0Ryz6v0o'
    Given url pharmacyBaseUrl
    And path 'health', 'dutyPharmacy'
    And header Authorization = 'apikey ' + token
    And header content-type = 'application/json'

  Scenario: Send GET request for on-duty pharmacies in Cankaya, Ankara and verify success is true
    And params { il: 'ankara', ilce: 'çankaya' }
    When method GET
    And print response
    Then response.success == 'true'
    Then status 200

  Scenario: Send GET request for Cankaya, Ankara and verify ERDIL ECZANESI is in the response
    And params { il: 'ankara', ilce: 'çankaya' }
    When method GET
    And print response
    Then response.result[0].name == 'ERDIL ECZANESI'
    Then status 200
