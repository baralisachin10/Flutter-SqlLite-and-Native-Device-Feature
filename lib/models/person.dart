import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Person {
  Person({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.profession,
    required this.image,
    String? id,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final String address;
  final String phoneNumber;
  final String profession;
  final File image;
}
