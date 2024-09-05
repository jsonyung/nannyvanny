import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/booking_model.dart';

class BookingsRepository {
  Future<List<Booking>> fetchBookings() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.cgprojects.in/lens8/api/dummy/current_booking_list'));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List<dynamic>? data = jsonResponse['response']; // Use 'response' key

        // Check if data is null
        if (data == null) {
          throw Exception('No bookings found');
        }

        print('Decoded data: $data');

        return data.map((json) => Booking.fromJson(json)).toList();
      } else {
        print('Failed to load bookings. Status code: ${response.statusCode}');
        throw Exception('Failed to load bookings');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Error fetching bookings: $e');
    }
  }
}
