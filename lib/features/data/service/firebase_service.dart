import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devvibe_landing/features/data/model/contact_form.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> submitContactForm(ContactForm form) async {
    try {
      await _firestore.collection('contact_forms').add(form.toJson());
    } on FirebaseException catch (e) {
      String errorMessage = 'An error occurred while submitting the form';
      
      switch (e.code) {
        case 'permission-denied':
          errorMessage = 'Permission denied. Please check Firestore rules.';
          break;
        case 'unavailable':
          errorMessage = 'Service is temporarily unavailable. Please try again later.';
          break;
        default:
          errorMessage = 'Error: ${e.message}';
      }
      
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Failed to submit form: $e');
    }
  }
} 