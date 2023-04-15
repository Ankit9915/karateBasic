Feature: update user using put calls

Background:
* url  'https://gorest.co.in'

* def requestPayload = 
"""
{
    
   
    "status": "inactive",
    "email": "ankit@gmail.com"
}

"""

Scenario: update user with given data

Given path '/public/v2/users/973483'
And request requestPayload
And header Authorization = 'Bearer ' + 'ee103efbe1798b2d161496e56a4d1d1a221f4decd8d0683d1284ae9da7aae7d5'
When method PUT
Then status 200
And match response.id == '#present'
And match response.name == '#present'
And match response.status == 'inactive'

