class Booking {
  final String title;
  final String fromDate;
  final String fromTime;
  final String toDate;
  final String toTime;

  Booking({
    required this.title,
    required this.fromDate,
    required this.fromTime,
    required this.toDate,
    required this.toTime,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      title: json['title'],
      fromDate: json['from_date'],
      fromTime: json['from_time'],
      toDate: json['to_date'],
      toTime: json['to_time'],
    );
  }
}
