# Requests

All requests to kardinal's API are made to a specific resource. A list of possible resources can be found [here](https://github.com/timothylevi/kardinal/tree/master/api_documentation/resources). Requests are made in this format:

    http://kardinal.timothylevi.com/api/[resource]

## Content Type

At the moment, POST and PUT requets are not available to developers using kardinal's API. In the future, POST and PUT requests will be accompanied by an API key, and accepted as either URL-encoded form data or JSON.

## Request Validation

All GET requests sent to kardinal's API will be valid provided they match the specific resource patterns outlined [here](https://github.com/timothylevi/kardinal/tree/master/api_documentation/resources).