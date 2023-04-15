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

Scenario: Create user with given data

Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer ' + 'ee103efbe1798b2d161496e56a4d1d1a221f4decd8d0683d1284ae9da7aae7d5'
When method POST
Then status 201
And match response.id == '#present'
And match response.name == '#present'
And match response.email == requestPayload.email

#first fetch user id from post call
* def userId = response.id
* print userId

#put call 

* def requestPayload = 
"""
{
    
    "name": "mamita Singh",
    "gender": "female",
    "status": "inactive"
}

"""
Given path '/public/v2/users/'+userId
And request requestPayload
And header Authorization = 'Bearer ' + 'ee103efbe1798b2d161496e56a4d1d1a221f4decd8d0683d1284ae9da7aae7d5'
When method PUT
Then status 200
And match response.id == userId
And match response.name == 'mamita Singh'
And match response.status == 'inactive'


