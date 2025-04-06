Feature: Alistirma

  Background:
    Given url petBaseUrl

  Scenario: pet bolumunde GET sorgusu yapılan API TESTI
    And path 'pet',250
    When method GET
    Then print response
    And status 404

  Scenario: store bolumunde GET sorgusu yapılan API TESTI
    And path 'store','inventory'
    When method GET
    Then print response
    And status 200
    When match response.sold == 7
    When match response.string == 545
    When match response.sold == '#number'

  Scenario: pet bolumunde POST sorgusu yapılan API TESTI
    And path 'pet'
    * def myRequestBody =
         """
         {
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
         """
    And request myRequestBody
    When method POST
    Then status 200
    * print response
    Then match myRequestBody.name == response.name
    Then match myRequestBody.category.id == response.category.id

  Scenario: pet bolumunde POST sorgusu yapılan API TESTI2
    And path 'pet'
    * def myRequestBody = read('classpath:data/pet.json')
    And request myRequestBody
    When method POST
    Then status 200
    Then match myRequestBody.name == response.name
    Then match myRequestBody.category.id == response.category.id

  Scenario Outline: pet bolumunde GET sorgusu outline senaryo ile yapılan API TESTI <id>
    And path 'pet',id
    When method GET
    Then print response
    And status 404

    Examples:
      | id  |
      | 250 |
      | 251 |
      | 252 |
      | 253 |

  Scenario: store bölümünden POST sorgusunu Generate.js kullanarak yapan API TESTI
    And path 'store','order'
    * def MyString = call read('classpath:data/generate.js') 5
    * print MyString
    * def myRequestBody = read('classpath:data/pet.json')
    And set myRequestBody.status = MyString
    And request myRequestBody
    When method POST
    * print response
    Then status 200

    Scenario: caller özelliğini kullanmak   ( cok kullandıgımız senaryolarda kullanılır)
      * def myCaller = call read('classpath:callers/demo.feature'){id:251}
      Then match myCaller.responseStatus == 404
      * print myCaller.response
      Then match myCaller.response.code == 1
      Then match myCaller.response.type == 'error'
      Then match myCaller.response.message == 'Pet not found'




