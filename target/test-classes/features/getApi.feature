Feature: Get Api Feature

Scenario: get user details

Given url 'https://gorest.co.in/public/v2/users'
And path '530'
When method GET
Then status 200
* print response
* def actgender = response.gender
* def status = response.status
* print actgender
* match actgender =='female'
* match status =='active'

Scenario: get user not found
Given url 'https://gorest.co.in/public/v2/posts'
And path '52'
When method GET
Then status 404