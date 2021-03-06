Feature: Create expenses integration test

  Background:
    * url 'http://localhost:8082/v1'
    * configure headers = { 'Content-Type': 'application/json' }

  Scenario Outline: positive case
    Given path 1
    And request <request>
    When method post
    Then status 200
    And match response == { maxPayment:'#number' }

Examples:
      | request                                                                                                                                                                                                                                                       |
	| {"coBorrowers": [2,3]}                              |
	| {"coBorrowers": [5]}                                |
	| {"coBorrowers": [9,7]}                              |
	| {"coBorrowers": [5,3,7,6 ]}                         |
	| {"coBorrowers": [10, 3]}                            |


Scenario Outline: negative client's ID case
    Given path -1
    And request <request>
    When method post
    Then status 400
    And match response == {"description":[{"clientId":"Is negative"}],"message":"Param error"}

Examples:
      | request                                                                                                                                                                                                                                                       |
	| {"coBorrowers": [2,3]}                              |
	| {"coBorrowers": [5]}                                |
	| {"coBorrowers": [9,7]}                              |
	| {"coBorrowers": [5,3,7,6 ]}                         |
	| {"coBorrowers": [1,10, 3]}                          |

                             

Scenario Outline: Coborrower's negstive ID case
    Given path 3
    And request <request>
    When method post
    Then status 400
    And match response == {"description":[{"coBorrowers":"Is negative"}],"message":"Validation error"}

Examples:
      | request                                                                                                                                                                                                                                                       |
	| {"coBorrowers": [-2,3]}                              |
	| {"coBorrowers": [-5]}                                |
	| {"coBorrowers": [9,-7]}                              |
	| {"coBorrowers": [5,3,7,-6 ]}                         |
	| {"coBorrowers": [-10, -3]}                           |


Scenario Outline: Coborrower's ID eqaul case
    Given path 1
    And request <request>
    When method post
    Then status 400
    And match response == {"description":[{"coBorrowers":"IDs are equal to each other"}],"message":"Validation error"}

Examples:
      | request                                                                                                                                                                                                                                                       |
	| {"coBorrowers": [3,3]}                                |
	| {"coBorrowers": [5, 2, 5]}                            |
	| {"coBorrowers": [7,7]}                                |
	| {"coBorrowers": [5,3,7,3 ]}                           |
	| {"coBorrowers": [10, 3, 10]}                          |


 Scenario Outline:  Coborrower's ID eqaul to client's ID case
    Given path 1
    And request <request>
    When method post
    Then status 400
    And match response == {"description":[{"coBorrowers":"Client's ID is equal to coborrower's ID"}],"message":"Validation error"}

Examples:
      | request                                                                                                                                                                                                                                                       |
	| {"coBorrowers": [1,3]}                              |
	| {"coBorrowers": [1]}                                |
	| {"coBorrowers": [9,1]}                              |
	| {"coBorrowers": [5,1,7,6 ]}                         |
	| {"coBorrowers": [10, 1]}                            |


