Feature: Search pet

  Background:

    * url 'https://petstore.swagger.io'

    Scenario: Search a pet

      * def add_a_pet_request =
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

      Given path '/v2/pet'
      And request add_a_pet_request
      When method POST
      Then status 200

      * def id_created_pet =  response.id
      * print "id: ", id_created_pet

      Given path '/v2/pet/',id_created_pet
      When method GET
      Then status 200
      And match response.id == id_created_pet
