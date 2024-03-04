import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { food, travel, leasure, work }

final uuid = const Uuid().v4();
final formatedDate = DateFormat.yMd();

final categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.travel_explore,
  Category.leasure: Icons.leak_add,
  Category.work: Icons.work,  
};

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

  String get getFormatedData {
    return formatedDate.format(date);
  }
}
