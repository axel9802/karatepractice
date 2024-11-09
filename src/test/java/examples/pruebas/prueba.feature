Feature: Prueba

    Background:
        * url 'https://reqres.in'

    Scenario: Get all users:

        Given path '/api/users?page=2'
        When method GET
        Then status 200

    Scenario: Get a specific user:

        Given path '/api/users/2'
        When method GET
        Then status 200

    Scenario: Create a user:
        * def create_user_request =
        """
           {
            "name": "morpheus",
            "job": "leader"
           }
        """
        Given path '/api/users'
        And request create_user_request
        When method POST
        Then status 201

        * def expectedName = create_user_request.name
        * def expectedJob = create_user_request.job

        And match response.name == expectedName
        And match response.job == expectedJob






