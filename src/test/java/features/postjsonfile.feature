Feature: Create user using post calls

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


* def requestPayload = read('classpath:src/test/resources/payload/user.json')
* requestPayload.email = emailRandom + "@gmail.com"
* print requestPayload


Scenario: Create user with given data

Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer ' + 'ee103efbe1798b2d161496e56a4d1d1a221f4decd8d0683d1284ae9da7aae7d5'
When method POST
Then status 201
And match response.id == '#present'
And match response.name == '#present'

