Feature: Create client integration test

  Background:
    * configure headers = { 'Content-Type': 'application/json' }
    * table payments
      | payment | date         | currency |
      | 172100  | '2019-02-02' | 'RUB'    |
      | 172100  | '2019-03-02' | 'RUB'    |
      | 172100  | '2019-04-02' | 'RUB'    |
      | 172100  | '2019-05-02' | 'RUB'    |
      | 172100  | '2019-06-02' | 'RUB'    |
      | 140760  | '2019-02-02' | 'RUB'    |

  Scenario: create loan and fully pay
    #create client
    Given url 'http://localhost:8080/v1'
    And request {"firstName":"A","lastName":"B","birthDate":"2005-05-30","passport":{"series":9999,"number":999999},"jobs":[],"sex":"male","maritalStatus":"single","children":0}
    When method post
    Then status 201
    And match response == { id:1 }

    #create 2nd client
    Given url 'http://localhost:8080/v1'
    And request {"firstName":"A","lastName":"B","birthDate":"2005-05-30","passport":{"series":9998,"number":999998},"jobs":[],"sex":"male","maritalStatus":"single","children":0}
    When method post
    Then status 201
    And def id = response.id
    And match response == { id:2 }

    #create loan
    Given url 'http://localhost:8083/v1'
    And request {"applicationId":4,"amount":1000000,"date":"2019-01-01","term":6,"currency":"RUB"}
    When method post
    Then status 200
    And match response == { id:1 }

    #1 payment
    Given url 'http://localhost:8083/v1'
    And path id
    And path "payment"
    And request payments[0]
    When method post
    Then status 200
    And match response == { paymentExecutedAt:payments[0].date }

    #2 payment
    Given url 'http://localhost:8083/v1'
    And path id
    And path "payment"
    And request payments[1]
    When method post
    Then status 200
    And match response == { paymentExecutedAt:payments[0].date }

    #3 payment
    Given url 'http://localhost:8083/v1'
    And path id
    And path "payment"
    And request payments[2]
    When method post
    Then status 200
    And match response == { paymentExecutedAt:payments[0].date }

    #4 payment
    Given url 'http://localhost:8083/v1'
    And path id
    And path "payment"
    And request payments[3]
    When method post
    Then status 200
    And match response == { paymentExecutedAt:payments[0].date }

    #5 payment
    Given url 'http://localhost:8083/v1'
    And path id
    And path "payment"
    And request payments[4]
    When method post
    Then status 200
    And match response == { paymentExecutedAt:payments[0].date }

    #6 payment
    Given url 'http://localhost:8083/v1'
    And path id
    And path "payment"
    And request payments[5]
    When method post
    Then status 200
    And match response == { paymentExecutedAt:payments[0].date }

    #Check if loan was payed of
    Given url 'http://localhost:8083/v1'
    And param client = 2
    When method get
    Then status 200
    And match response.loans[0].completed == true