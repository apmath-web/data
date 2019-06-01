Feature: Update client integration test

  Background:
    * url 'http://localhost:8080/v1/'
    * configure headers = { 'Content-Type': 'application/json' }

  Scenario Outline: update client positive
    Given request <request>
    When method post
    Then status 201
    And match response == { id:'#number' }
    And def id = response.id

    * def key = <key>
    * def val = <value>
    * def req = <request>
    * eval req[key] = val
    Given path id
    Given request req
    When  method put
    Then status 204

    Given path id
    When method get
    Then status 200
    And match response contains req


    Examples:
      | request                                                                                                                                                                                                                                                       | key             | value                              |
      | {"birthDate":"2019-01-02","firstName":"TestUser","lastName":"Testerov","passport":{"series":1234,"number":847883},"jobs":[{"name":"test1","wage":72364},{"name":"test4","wage":67628}],"sex":"male","maritalStatus":"married"}                                | "firstName"     | "lev"                              |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2005-05-30","passport":{"series":4356,"number":351363},"jobs":[{"name":"test1","wage":187623},{"name":"test4","wage":32641}],"sex":"male","maritalStatus":"single","children":0}                   | "lastName"      | "kovalenko"                        |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2012-04-03","passport":{"series":9847,"number":866233},"jobs":[{"name":"test1","wage":36434},{"name":"test4","wage":4637}],"sex":"female","maritalStatus":"married","children":1}                  | "sex"           | "male"                             |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2007-07-07","passport":{"series":2345,"number":215343},"jobs":null,"sex":"male","maritalStatus":"married","children":0}                                                                            | "maritalStatus" | "single"                           |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2000-01-01","passport":{"series":2342,"number":812633},"jobs":[{"name":"market","wage":23667}],"sex":"male","maritalStatus":"married","children":3}                                                | "birthDate"     | "1999-02-02"                       |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1999-12-31","passport":{"series":4361,"number":465283},"jobs":[{"name":"test1","wage":19437},{"name":"test4","wage":23856},{"name":"test4","wage":23565}],"sex":"female","maritalStatus":"single"} | "firstName"     | "sasha"                            |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1899-05-05","passport":{"series":9730,"number":198243},"jobs":[{"name":"test1","wage":536446},{"name":"test4","wage":53644346}],"sex":"male","maritalStatus":"married","children":2}               | "passport"      | {"series":6734, "number":763412 }  |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2000-09-04","passport":{"series":2342,"number":210983},"jobs":[{"name":"test1","wage":45638},{"name":"test4","wage":23654}],"sex":"male","maritalStatus":"married","children":3}                   | "jobs"          | null                               |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1015-03-27","passport":{"series":8763,"number":328653},"jobs":[{"name":"test1","wage":36473},{"name":"test4","wage":43645}],"sex":"female","maritalStatus":"married","children":1}                 | "jobs"          | [{"name":"market","wage":23667}]   |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2001-08-23","passport":{"series":6125,"number":328743},"jobs":[{"name":"test1","wage":438765},{"name":"test4","wage":164425}],"sex":"male","maritalStatus":"married"}                              | "sex"           | "female"                           |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2010-01-12","passport":{"series":2374,"number":934733},"jobs":[{"name":"test1","wage":12873},{"name":"test4","wage":62452}],"sex":"female","maritalStatus":"married","children":4}                 |"lastName"       | "fdgder"                           |

  Scenario Outline: update client negative
    Given request <request>
    When method post
    Then status 201
    And match response == { id:'#number' }
    And def id = response.id

    * def key = <key>
    * def val = <value>
    * def req = <request>
    * eval req[key] = val
    Given path id
    Given request req
    When  method put
    Then status 400
    And match response contains any { message:'#string',description:'#list'}


    Examples:
      | request                                                                                                                                                                                                                                                       | key             | value                              |
      | {"birthDate":"2019-01-02","firstName":"TestUser","lastName":"Testerov","passport":{"series":1234,"number":847882},"jobs":[{"name":"test1","wage":72364},{"name":"test4","wage":67628}],"sex":"male","maritalStatus":"married"}                                | "firstName"     | null                               |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2005-05-30","passport":{"series":4356,"number":351362},"jobs":[{"name":"test1","wage":187623},{"name":"test4","wage":32641}],"sex":"male","maritalStatus":"single","children":0}                   | "lastName"      | 3847553                            |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2012-04-03","passport":{"series":9847,"number":866232},"jobs":[{"name":"test1","wage":36434},{"name":"test4","wage":4637}],"sex":"female","maritalStatus":"married","children":1}                  | "sex"           | "fdgd"                             |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2007-07-07","passport":{"series":2345,"number":215342},"jobs":null,"sex":"male","maritalStatus":"married","children":2}                                                                            | "maritalStatus" | "single"                           |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2000-01-01","passport":{"series":2342,"number":812632},"jobs":[{"name":"market","wage":23667}],"sex":"male","maritalStatus":"married","children":3}                                                | "birthDate"     | "1999.02.02"                       |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1999-12-31","passport":{"series":4361,"number":465282},"jobs":[{"name":"test1","wage":19437},{"name":"test4","wage":23856},{"name":"test4","wage":23565}],"sex":"female","maritalStatus":"single"} | "firstName"     | true                               |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1899-05-05","passport":{"series":9730,"number":198242},"jobs":[{"name":"test1","wage":536446},{"name":"test4","wage":53644346}],"sex":"male","maritalStatus":"married","children":2}               | "passport"      | {"series":67634, "number":76412 }  |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2000-09-04","passport":{"series":2342,"number":210982},"jobs":[{"name":"test1","wage":45638},{"name":"test4","wage":23654}],"sex":"male","maritalStatus":"married","children":3}                   | "jobs"          | "dfg"                              |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1015-03-27","passport":{"series":8763,"number":328652},"jobs":[{"name":"test1","wage":36473},{"name":"test4","wage":43645}],"sex":"female","maritalStatus":"married","children":1}                 | "jobs"          | [{"name":"market","wage":-2}]      |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2001-08-23","passport":{"series":6125,"number":328742},"jobs":[{"name":"test1","wage":438765},{"name":"test4","wage":164425}],"sex":"male","maritalStatus":"married"}                              | "sex"           | "feerle"                           |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2010-01-12","passport":{"series":2374,"number":934732},"jobs":[{"name":"test1","wage":12873},{"name":"test4","wage":62452}],"sex":"female","maritalStatus":"married","children":4}                 |"lastName"       | 4634564664                         |
