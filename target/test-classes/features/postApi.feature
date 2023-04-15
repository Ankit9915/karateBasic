Feature: Create user using post calls

Background:
* url  'https://gorest.co.in'

* def requestPayload = 
"""
{
    
    "name": "kalpesh Singh",
    "email": "kalpeshgtf@west-carter.info",
    "gender": "male",
    "status": "active"
}

"""

Scenario: Create user with given data

Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer ' + 'ee103efbe1798b2d161496e56a4d1d1a221f4decd8d0683d1284ae9da7aae7d5'
When method POST
Then status 201
And match response.id == '#present'
And match response.name == '#present'

