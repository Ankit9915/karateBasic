Feature: Delete user using delete calls

  Background: 
    * url  'https://gorest.co.in'
    * def random_string =
      """
        function(s){
           var text = "";
           var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
           for(var i =0;i<s;i++)
           text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
           return text;
      }

      """
    * def emailRandom = random_string(10)
    * def requestPayload =
      """
      {
          
          "name": "kalpesh Singh",
          "gender": "male",
          "status": "active"
      }

      """
    * requestPayload.email = emailRandom + "@gmail.com"
    * print requestPayload

  Scenario: delete user with given use id
    #1st Create User by using post call
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + 'ee103efbe1798b2d161496e56a4d1d1a221f4decd8d0683d1284ae9da7aae7d5'
    When method POST
    Then status 201
    * def userId = response.id
    * print userId
    #2nd Delete the same user id by using delete call
    Given path '/public/v2/users/' + userId
    And request requestPayload
    And header Authorization = 'Bearer ' + 'ee103efbe1798b2d161496e56a4d1d1a221f4decd8d0683d1284ae9da7aae7d5'
    When method DELETE
    Then status 204
    #3rd get the same user by using same user id
    Given url 'https://gorest.co.in/public/v2/users/' + userId
    When method GET
    Then status 404
    And match response.message == "Resource not found"
