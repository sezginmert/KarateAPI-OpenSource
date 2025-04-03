Feature: PetStore üzerindeki GET sorgusu ile yapılan Api Test'leri

  Scenario: pet bölümündeki GET sorgusu yapılan API TESTI
    Given url petBaseUrl
    And path 'pet',250
    When method GET
    Then print response
    And status 404

    Scenario: store bölümündeki GET sorgusu yapılan API TESTI
      Given url petBaseUrl
      And path 'store','inventory'
      When method GET
      Then print response
      And status 200

     Scenario: user bölümündeki GET sorgusu yapılan API TESTI
       Given url petBaseUrl
       And path 'user','login'
       When method GET
       Then print response
       And status 200

       Scenario Outline: pet bölümünde GET sorgusu outline senaryo ile yapılan API TESTI <id>

         Given url petBaseUrl
         And path 'pet',id
         When method GET
         Then print response
         And status 404

         Examples:
         | id |
         | 250  |
         | 251  |
         | 252  |
         | 253  |


  Scenario Outline: pet bölümünde GET sorgusu outline senaryo ile yapılan API TESTI 2.teknik - <id>
   // yapamadım !!!!!!!!!
    Given url petBaseUrl
    And path 'pet'
    And path <id>
    When method GET
    Then print response
    And status 404

    Examples:
      | id |
      | read('classpath:data/examples.csv') |








