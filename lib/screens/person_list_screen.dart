import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/provider/person_provider.dart';
import 'package:portfolio_app/screens/add_person_screen.dart';
import 'package:portfolio_app/widgets/person_list.dart';

class PersonListScreen extends ConsumerWidget {
  const PersonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final persons = ref.watch(personProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddPresonScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: PersonList(persons: persons),
    );
  }
}
