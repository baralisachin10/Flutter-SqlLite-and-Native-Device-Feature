import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/provider/person_provider.dart';
import 'package:portfolio_app/screens/person_detail_screen.dart';

class PersonList extends ConsumerWidget {
  const PersonList({
    super.key,
    required this.persons,
  });

  final List<Person> persons;

  void removePerson(WidgetRef ref, Person person) {
    ref.watch(personProvider.notifier).removePerson(person);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = Center(
      child: Text(
        'No person added yet!',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );

    if (persons.isNotEmpty) {
      content = ListView.builder(
        itemCount: persons.length,
        itemBuilder: (ctx, index) => Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PersonDetailScreen(
                    person: persons[index],
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: FileImage(persons[index].image),
            ),
            title: Text(
              persons[index].name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              persons[index].address,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            trailing: IconButton(
              onPressed: () {
                removePerson(ref, persons[index]);
              },
              icon: const Icon(
                Icons.delete,
                size: 30,
              ),
            ),
          ),
        ),
      );
    }

    return content;
  }
}
