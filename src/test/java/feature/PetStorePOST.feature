Feature: PetStore üzerindeki POST sorgusu ile yapılan Api Test'leri

  Scenario: pet bölümunden POST sorgusu yapılan API TESTI
    Given url petBaseUrl
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
    Then match response.id == '#number'
    Then match response.name == myRequestBody.name
    Then print response


  Scenario: store bölümunden POST sorgusu yapılan API TESTI
    Given url petBaseUrl
    And path 'store','order'
    * def myRequestBody = read('classpath:data/pet.json')
    Then request myRequestBody
    When method POST
    Then status 200
    Then print response
    Then myRequestBody.id == response.id
    Then myRequestBody.petId == response.petId
    Then response.status == 'placed'


  Scenario: store bölümünden POST sorgusunu Generate.js kullanarak yapan API TESTI
    Given url petBaseUrl
    And path 'store','order'
    * def MyString = call read('classpath:data/generate.js') 5
    * print MyString
    * def myRequestBody = read('classpath:data/pet.json')
    And set myRequestBody.status = MyString
    And request myRequestBody
    When method POST
    * print response
    Then status 200

