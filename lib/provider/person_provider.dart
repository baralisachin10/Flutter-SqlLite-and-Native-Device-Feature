import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbpath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbpath, 'persons.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE person_list(id TEXT PRIMARY KEY,name TEXT, profession TEXT, address TEXT, phoneNumber TEXT, image TEXT )'); //creating database table
    },
    version: 1,
  );
  return db;
}

class PersonNotifier extends StateNotifier<List<Person>> {
  PersonNotifier() : super(const []);

  Future<void> loadPerson() async {
    final db = await _getDatabase();
    final data = await db.query('person_list');
    final persons = data
        .map(
          (row) => Person(
            id: row['id'] as String,
            name: row['name'] as String,
            address: row['address'] as String,
            phoneNumber: row['phoneNumber'] as String,
            profession: row['profession'] as String,
            image: File(row['image'] as String),
          ),
        )
        .toList();

    state = persons;
  }

  void addPerson({
    required String fullName,
    required String profession,
    required String address,
    required String phoneNumber,
    required File image,
  }) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    final newPerson = Person(
      name: fullName,
      profession: profession,
      address: address,
      phoneNumber: phoneNumber,
      image: copiedImage,
    );

    final db = await _getDatabase();
    db.insert('person_list', {
      'id': newPerson.id,
      'name': newPerson.name,
      'profession': newPerson.profession,
      'address': newPerson.address,
      'phoneNumber': newPerson.phoneNumber,
      'image': newPerson.image.path,
    });

    state = [newPerson, ...state];
  }

  void removePerson(Person person) {
    state = state.where((per) => per.id != person.id).toList();
  }
}

final personProvider = StateNotifierProvider<PersonNotifier, List<Person>>(
    (ref) => PersonNotifier());
