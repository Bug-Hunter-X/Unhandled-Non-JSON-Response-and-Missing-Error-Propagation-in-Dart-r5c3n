# Unhandled Non-JSON Response and Missing Error Propagation in Dart

This example demonstrates a common error in Dart asynchronous programming: failing to handle cases where an API response is not a valid JSON string, and not properly propagating errors.

The `fetchData` function makes an HTTP request.  If the response status code is 200 (success), it attempts to decode the response body as JSON. However, it doesn't check if the response body is actually valid JSON, leading to a potential `FormatException` if the response is not JSON.  Additionally, the `catch` block only prints the error and doesn't rethrow it, preventing higher-level error handling.

The solution provides robust error handling, including checking the response content type and handling various error scenarios.