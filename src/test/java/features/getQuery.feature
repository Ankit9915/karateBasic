Feature: get Api using Query Parameter

Scenario: get specific user details by using query parameter

* def query = {status:'inactive',gender:'female'}
Given url 'https://gorest.co.in/public/v2/users'
And params query
When method GET
Then status 200
* print response