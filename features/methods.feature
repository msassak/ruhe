Feature: HTTP methods 

  Scenario: GET
    When / receives GET
    Then it responds 200 OK with:
      """
      {
          "people": []
      }
      """
    
  Scenario: POST
    When / receives POST with:
      """
      {
          "person": {
              "name": "Joey Joe-Joe Junior Shabadoo"
          }
      }
      """
    Then it responds 201 Created
