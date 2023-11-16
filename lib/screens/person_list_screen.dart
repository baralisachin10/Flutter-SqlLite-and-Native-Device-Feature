import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/provider/person_provider.dart';
import 'package:portfolio_app/screens/add_person_screen.dart';
import 'package:portfolio_app/widgets/person_list.dart';

class PersonListScreen extends ConsumerStatefulWidget {
  const PersonListScreen({super.key});

  @override
  ConsumerState<PersonListScreen> createState() => _PersonListScreenState();
}

class _PersonListScreenState extends ConsumerState<PersonListScreen> {
  late Future<void> _personList;

  @override
  void initState() {
    super.initState();
    _personList = ref.read(personProvider.notifier).loadPerson();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: _personList,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : PersonList(persons: persons),
      ),
    );
  }
}
