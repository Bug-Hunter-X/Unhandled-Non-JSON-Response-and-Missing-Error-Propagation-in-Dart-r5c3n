```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200 && response.headers['content-type']!.contains('application/json')) {
      try {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data;
      } on FormatException catch (e) {
        print('Invalid JSON format: $e');
        return null; // Or throw a custom exception
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode} ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow; // Re-throw the exception to be handled by a higher-level function
  }
}
```