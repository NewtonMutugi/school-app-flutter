import 'package:get/get.dart';

class Unit {
  final int id;
  final String name;
  final String venue;
  final String dayOfWeek;
  final int duration;
  final String facilitator;

  Unit({
    required this.id,
    required this.name,
    required this.venue,
    required this.dayOfWeek,
    required this.duration,
    required this.facilitator,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      name: json['name'],
      venue: json['venue'],
      dayOfWeek: json['day_of_week'],
      duration: json['duration'],
      facilitator: json['facilitator'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'venue': venue,
      'day_of_week': dayOfWeek,
      'duration': duration,
      'facilitator': facilitator,
    };
  }
}
