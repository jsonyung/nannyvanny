import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/package_model.dart';

class PackagesRepository {
  Future<List<Package>> fetchPackages() async {
    try {
      final response = await http.get(
          Uri.parse('https://www.cgprojects.in/lens8/api/dummy/packages_list'));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List<dynamic>? data = jsonResponse['response']; // Use 'response' key

        // Check if data is null
        if (data == null) {
          throw Exception('No packages found');
        }

        print('Decoded data: $data');

        return data.map((json) => Package.fromJson(json)).toList();
      } else {
        print('Failed to load packages. Status code: ${response.statusCode}');
        throw Exception('Failed to load packages');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Error fetching packages: $e');
    }
  }
}
