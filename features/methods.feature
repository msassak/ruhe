Feature: HTTP methods 

  Scenario: GET
    When / receives GET
    Then it responds 200 OK with:
      """
      {
          "name": "Joey Joe-Joe Junior Shabadoo"
      }
      """
