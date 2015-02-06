Feature: Documentation support
  In order to build an auto-discoverable API
  As a client software developer
  I need to know the specifications of objects I send and receive

  @createSchema
  @dropSchema
  Scenario: Retrieve the first page of a collection
    And I send a "GET" request to "/vocab"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON should be equal to:
    """
    {
      "@context": "\/contexts\/ApiDocumentation",
      "@id": "\/vocab",
      "hydra:title": "My Dummy API",
      "hydra:description": "This is a test API.",
      "hydra:entrypoint": "\/",
      "hydra:supportedClass": [
        {
          "@id": "Entrypoint",
          "@type": "hydra:class",
          "hydra:title": "The API entrypoint",
          "hydra:supportedProperty": [
            {
              "@type": "hydra:SupportedProperty",
              "hydra:property": "dummies",
              "hydra:title": "The collection of Dummy resources",
              "hydra:readable": true,
              "hydra:writable": false,
              "hydra:supportedOperation": [
                {
                  "@type": "hydra:Operation",
                  "hydra:title": "Retrieves the collection of Dummy resources.",
                  "hydra:returns": "hydra:PagedCollection",
                  "hydra:method": "GET"
                },
                {
                  "@type": "hydra:CreateResourceOperation",
                  "hydra:title": "Creates a Dummy resource.",
                  "hydra:expects": "Dummy",
                  "hydra:returns": "Dummy",
                  "hydra:method": "POST"
                }
              ]
            }
          ]
        },
        {
          "@id": "Dummy",
          "@type": "hydra:Class",
          "hydra:title": "Dummy",
          "hydra:description": "Dummy.",
          "hydra:supportedProperty": [
            {
              "@type": "hydra:SupportedProperty",
              "hydra:property": "Dummy\/id",
              "hydra:title": "id",
              "hydra:required": false,
              "hydra:readable": true,
              "hydra:writable": false
            },
            {
              "@type": "hydra:SupportedProperty",
              "hydra:property": "Dummy\/name",
              "hydra:title": "name",
              "hydra:required": true,
              "hydra:readable": true,
              "hydra:writable": true
            },
            {
              "@type": "hydra:SupportedProperty",
              "hydra:property": "Dummy\/dummy",
              "hydra:title": "dummy",
              "hydra:required": false,
              "hydra:readable": true,
              "hydra:writable": true
            }
          ],
          "hydra:supportedOperation": [
            {
              "@type": "hydra:Operation",
              "hydra:title": "Retrieves Dummy resource.",
              "hydra:returns": "Dummy",
              "hydra:method": "GET"
            },
            {
              "@type": "hydra:ReplaceResourceOperation",
              "hydra:title": "Replaces the Dummy resource.",
              "hydra:expects": "Dummy",
              "hydra:returns": "Dummy",
              "hydra:method": "PUT"
            },
            {
              "@type": "hydra:Operation",
              "hydra:title": "Deletes the Dummy resource.",
              "hydra:expects": "Dummy",
              "hydra:method": "DELETE"
            }
          ]
        }
      ]
    }
    """