import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/models/person.dart';

class PersonNotifier extends StateNotifier<List<Person>> {
  PersonNotifier() : super(const []);

  void addPerson({
    required String fullName,
    required String profession,
    required String address,
    required String phoneNumber,
    required File image,
  }) {
    final newPerson = Person(
      name: fullName,
      profession: profession,
      address: address,
      phoneNumber: phoneNumber,
      image: image,
    );

    state = [newPerson, ...state];
  }

  void removePerson(Person person) {
    state = state.where((per) => per.id != person.id).toList();
  }
}

final personProvider = StateNotifierProvider<PersonNotifier, List<Person>>(
    (ref) => PersonNotifier());
