import 'package:flutter/material.dart';
import 'package:portfolio_app/models/person.dart';

class PersonDetailScreen extends StatelessWidget {
  const PersonDetailScreen({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
    );
  }
}
