import 'package:cloud_firestore/cloud_firestore.dart';

class ContactForm {
  final String name;
  final String email;
  final String budget;
  final String projectDescription;

  ContactForm({
    required this.name,
    required this.email,
    required this.budget,
    required this.projectDescription,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'budget': budget,
      'projectDescription': projectDescription,
      'timestamp': FieldValue.serverTimestamp(),
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
} 