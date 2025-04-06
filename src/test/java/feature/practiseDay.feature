Feature: Practise Day'de yapılacak Api Testleri


  Scenario: Burada pet bölmesindeki Get sorgusu yapılacak
    Given url petBaseUrl
    When path 'pet',250
    When method GET
    * print response
    And status 404

    Scenario: Burada store bölmesindeki Get sorgusu yapılacak
      Given url petBaseUrl
      When path 'store','inventory'
      When method GET
      * print response
      And status 200
      When match response.sold == '#number'
      When match response.pending == '#number'

      Scenario: Burada pet bölmesinde Post sorgusu yapılacak
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
        * print response
        Then match myRequestBody.name == response.name
        Then match myRequestBody.category.id == response.category.id

        Scenario: Burada pet bolumunde Post sorgusu yapılacak teknik 2
          Given url petBaseUrl
          When path 'pet'
          * def myRequestBody = read('classpath:data/pet.json')
          And request myRequestBody
          When method POST
          Then match myRequestBody.name == response.name
          Then match myRequestBody.category.id == response.category.id

          Scenario Outline: pet bolumundeki GET sorgusunu senaryo outline ile yapmak <id>
            Given url petBaseUrl
            When path 'pet',id
            When method GET
            Then print response
            And status 404

            Examples:
              |id|
              |250|
              |251|
              |252|
              |253|

            Scenario:  store bölümünden POST sorgusunu GEnerate.js kullanarak yapan api testi
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

              Scenario:  caller özelligini kullanmak
                * def myCaller = call read('classpath:callers/demo.feature'){id:251}
                Then match myCaller.responseStatus == 404
                * print myCaller.response
                Then match myCaller.response.code == 1
                Then match myCaller.response.type == 'error'
                Then match myCaller.response.message == 'Pet not found'







