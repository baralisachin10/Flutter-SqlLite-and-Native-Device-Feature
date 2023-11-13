import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/provider/person_provider.dart';
import 'package:portfolio_app/widgets/image_input.dart';
import 'package:portfolio_app/widgets/input_field.dart';

class AddPresonScreen extends ConsumerStatefulWidget {
  const AddPresonScreen({super.key});

  @override
  ConsumerState<AddPresonScreen> createState() => _AddPresonScreenState();
}

class _AddPresonScreenState extends ConsumerState<AddPresonScreen> {
  final _fullNameController = TextEditingController();
  final _professionController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _selectedImage;

  @override
  void dispose() {
    _fullNameController.dispose();
    _professionController.dispose();
    super.dispose();
  }

  void _savePerson() {
    final fullName = _fullNameController.text;
    final profession = _professionController.text;
    final address = _addressController.text;
    final phoneNumber = _phoneController.text;

    if (fullName.isEmpty ||
        profession.isEmpty ||
        address.isEmpty ||
        phoneNumber.isEmpty) {
      return;
    }

    ref.read(personProvider.notifier).addPerson(
          fullName: fullName,
          profession: profession,
          address: address,
          phoneNumber: phoneNumber,
          image: _selectedImage!,
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Person'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ImageInput(
              onSelectImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // name of person
            InputField(labelText: 'Full Name', controller: _fullNameController),

            // profession of a person
            const SizedBox(
              height: 10,
            ),
            InputField(
                labelText: 'Profession', controller: _professionController),

            const SizedBox(
              height: 10,
            ),
            InputField(labelText: 'Address', controller: _addressController),

            const SizedBox(
              height: 10,
            ),
            InputField(
              labelText: 'Phone no.',
              controller: _phoneController,
              keybordType: TextInputType.number,
            ),

            //button to add person
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: _savePerson,
              icon: const Icon(Icons.add),
              label: const Text('Add Person'),
            ),
          ],
        ),
      ),
    );
  }
}
