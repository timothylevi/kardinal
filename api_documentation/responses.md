# Responses

At the moment, kardinal only supports GET requests to its API. Below is a list of the possible responses you might receive.

## Response Codes

The following HTTP status codes are possible in response to a request:
<table>
    <thead>
        <th>HTTP Status Code</th>
        <th>Status</th>
        <th>Description</th>
    </thead>
    <tbody>
        <tr>
            <td>200</td>
            <td>OK (Immediate response)</td>
            <td>The request was a success and the response includes the
                requested data.</td>
        </tr>
        <tr>
            <td>400</td>
            <td>Bad Request</td>
            <td>The request was malformed or unexpected.</td>
        </tr>
        <tr>
            <td>404</td>
            <td>Not Found</td>
            <td>The requested resource was not found.</td>
        </tr>
        <tr>
            <td>415</td>
            <td>Unsupported Media Type</td>
            <td>The request was sent with a specified format that is not
                supported.</td>
        </tr>
        <tr>
            <td>500</td>
            <td>Internal Server Error</td>
            <td>The request could not be fulfilled due to an unexpected
                error.</td>
        </tr>
    </tbody>
</table>

## Response Format

All responses will be sent in JSON.