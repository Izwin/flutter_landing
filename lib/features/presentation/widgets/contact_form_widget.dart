import 'package:devvibe_landing/core/theme/app_colors.dart';
import 'package:devvibe_landing/features/data/model/contact_form.dart';
import 'package:devvibe_landing/features/data/service/firebase_service.dart';
import 'package:devvibe_landing/features/presentation/widgets/animated_gradient_button.dart';
import 'package:flutter/material.dart';
class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String _selectedBudget ='1000';
  final _descriptionController = TextEditingController();
  final FirebaseService _firebaseService = FirebaseService();

  bool _isSubmitting = false;
  String? _errorMessage;
  bool _isSuccess = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
        _errorMessage = null;
      });

      try {
        final contactForm = ContactForm(
          name: _nameController.text,
          email: _emailController.text,
          budget: _selectedBudget,
          projectDescription: _descriptionController.text,
        );

        await _firebaseService.submitContactForm(contactForm);

        setState(() {
          _isSubmitting = false;
          _isSuccess = true;
        });

        // Reset form
        _nameController.clear();
        _emailController.clear();
        _selectedBudget = '1000';
        _descriptionController.clear();
      } catch (e) {


        setState(() {
          _isSubmitting = false;
          _errorMessage = e.toString().replaceAll('Exception: ', '');
        });
        print('Error submitting form: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isSuccess) {
      return _buildSuccessMessage();
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Let\'s Work Together',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.accent2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Fill out the form below to get started on your project',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Your Name',
              prefixIcon: Icon(Icons.person_outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedBudget,
            decoration: const InputDecoration(
              labelText: 'Project Budget',
              prefixIcon: Icon(Icons.attach_money),
            ),
            items: ['1000','2000', '5000', '10000+']
                .map((budget) => DropdownMenuItem(
              value: budget,
              child: Text('\$$budget'),
            ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedBudget = value;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Project Description',
              prefixIcon: Icon(Icons.description_outlined),
              alignLabelWithHint: true,
            ),
            minLines: 3,
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please describe your project';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          if (_errorMessage != null) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.red),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          AnimatedGradientButton(
            text: _isSubmitting ? 'Submitting...' : 'Submit',
            onPressed: _isSubmitting ? null : _submitForm,
            gradientColors: AppColors.gradientAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            'Message Sent Successfully!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Thank you for reaching out. I will get back to you shortly.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          AnimatedGradientButton(
            text: 'Send Another Message',
            onPressed: () {
              setState(() {
                _isSuccess = false;
              });
            },
            gradientColors: AppColors.gradientAccent,
          ),
        ],
      ),
    );
  }
}