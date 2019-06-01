Feature: Create client integration test

  Background:
    * url 'http://localhost:8080/v1'
    * configure headers = { 'Content-Type': 'application/json' }

  Scenario Outline: create client positive
    Given request <request>
    When method post
    Then status 201
    And match response == { id:'#number' }


    Examples:
      | request                                                                                                                                                                                                                                                       |
      | {"birthDate":"2019-01-02","firstName":"TestUser","lastName":"Testerov","passport":{"series":1234,"number":847880},"jobs":[{"name":"test1","wage":72364},{"name":"test4","wage":67628}],"sex":"male","maritalStatus":"married"}                                |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2005-05-30","passport":{"series":4356,"number":351360},"jobs":[{"name":"test1","wage":187623},{"name":"test4","wage":32641}],"sex":"male","maritalStatus":"single","children":0}                   |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2012-04-03","passport":{"series":9847,"number":866230},"jobs":[{"name":"test1","wage":36434},{"name":"test4","wage":4637}],"sex":"female","maritalStatus":"married","children":1}                  |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2007-07-07","passport":{"series":2345,"number":215340},"jobs":null,"sex":"male","maritalStatus":"married","children":2}                                                                              |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2000-01-01","passport":{"series":2342,"number":812630},"jobs":[{"name":"market","wage":23667}],"sex":"male","maritalStatus":"married","children":3}                                                |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1999-12-31","passport":{"series":4361,"number":465280},"jobs":[{"name":"test1","wage":19437},{"name":"test4","wage":23856},{"name":"test4","wage":23565}],"sex":"female","maritalStatus":"single"} |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1899-05-05","passport":{"series":9730,"number":198240},"jobs":[{"name":"test1","wage":536446},{"name":"test4","wage":53644346}],"sex":"male","maritalStatus":"married","children":2}               |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2000-09-04","passport":{"series":2342,"number":210980},"jobs":[{"name":"test1","wage":45638},{"name":"test4","wage":23654}],"sex":"male","maritalStatus":"married","children":3}                   |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1015-03-27","passport":{"series":8763,"number":328650},"jobs":[{"name":"test1","wage":36473},{"name":"test4","wage":43645}],"sex":"female","maritalStatus":"married","children":1}                 |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2001-08-23","passport":{"series":6125,"number":328740},"jobs":[{"name":"test1","wage":438765},{"name":"test4","wage":164425}],"sex":"male","maritalStatus":"married"}                              |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2010-01-12","passport":{"series":2374,"number":934730},"jobs":[{"name":"test1","wage":12873},{"name":"test4","wage":62452}],"sex":"female","maritalStatus":"married","children":4}                 |

  Scenario Outline: create client negative
    Given request <request>
    When method post
    Then status 400
    And match response contains{ message:'#string' }
    And match response contains any { message:'#string',description:'#list'}


    Examples:
      | request                                                                                                                                                                                                                                                       |
      | {"firstName":"","lastName":"Testerov","birthDate":"2019-01-02","Passport":{"series":124,"number":84782},"Jobs":[{"name":"test1"},{"name":"test4","wage":67628}],"sex":"male","maritalStatus":"married"}                                                       |
      | {"firstName":"TestUser","lastName":"","birthDate":"2005-05-30","Passport":{"series":4356,"number":3512367},"Jobs":[{"name":"test1"},{"name":"","wage":32641}],"sex":"male","maritalStatus":"single","children":0}                                             |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2012.00.03","Passport":{"series":98147,"number":866234},"Jobs":[{"name":"test1","wage":36434},{"name":"test4","wage":0}],"sex":"female","maritalStatus":"single","children":1}                     |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"07-07-2000","Passport":{"series":2345,"number":215344},"Jobs":[],"sex":"male","maritalStatus":"married","children":2}                                                                              |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2000-01-01","Passport":{"series":2342,"number":812636},"Jobs":[{"name":"market","wage":-23667}],"sex":"male","maritalStatus":"married","children":3}                                               |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1999-12-31","Passport":{"series":4361,"number":465283},"Jobs":[{}],"sex":"female","maritalStatus":"dfgdewf"}                                                                                       |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1899-05-35","Passport":{"series":9730,"number":198243},"Jobs":[{"name":"test4","wage":53644346}],"sex":"Male","maritalStatus":"single","children":2}                                               |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2000-09-04","Passport":{"series":2342,"number":210983},"Jobs":[{"name":"test1","wage":45638},{"name":"test4","wage":-23654}],"sex":"Female","maritalStatus":"married","children":-3}               |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"1015.03.27","Passport":{"series":763,"number":328654},"Jobs":[{"name":"test1","wage":36473},{"name":"test4","wage":43645}],"sex":"dsgf","maritalStatus":"married","children":1}                    |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2001-13-23","Passport":{"series":6125,"number":328742},"Jobs":[{"name":"test1","wage":438765},{"name":"test4","wage":164425}],"sex":326452,"maritalStatus":"married"}                              |
      | {"firstName":"TestUser","lastName":"Testerov","birthDate":"2010/01/12","Passport":{"series":2374,"number":93432},"Jobs":[{"name":"test1","wage":12873},{"name":"test4","wage":-62452}],"sex":True,"maritalStatus":"marrdsied","children":4}                   |
      | {}                                                                                                                                                                                                                                                            |
