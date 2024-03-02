import 'package:uuid/uuid.dart';

enum Category { food, travel, leasure, work }

final uuid = const Uuid().v4();

class ExpenceModel {
  ExpenceModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
