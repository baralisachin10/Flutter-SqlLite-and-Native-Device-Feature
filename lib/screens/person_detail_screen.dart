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
      body: Stack(
        children: [
          Image.file(
            person.image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    // profession
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          person.profession,
                        ),
                      ],
                    ),
                    const Spacer(),
                    //contact number
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(person.phoneNumber),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
