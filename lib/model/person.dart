import 'dart:core';

import 'package:contact_app/model/telephone.dart';

class Person {
  final int id;
  final String name;
  final String? job;
  final String address;
  final String? email;
  final List<Telephone>? telephone;

  const Person({
    required this.id,
    required this.name,
    this.job,
    required this.address,
    this.email,
    this.telephone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'job': job,
      'address': address,
      'email': email,
      'telephone': telephone,
    };
  }

  factory Person.fromMap({required Map<String, dynamic> map, List<Map<String, Object?>>? telp}) {
    Person person;

    if (telp == null) {
      person = Person(
        id: map['id_person'] as int,
        name: map['person_name'] as String,
        job: map['job'] as String?,
        address: map['address'] as String,
        email: map['email'] as String?
      );
    } else {
      List<Telephone> telps = <Telephone>[];
      // telp.forEach((element) => telps.add(Telephone.fromMap(element)));

      telp.isNotEmpty ?
          telp.forEach((element) => telps.add(Telephone.fromMap(element)))
      :
          null;

      person = Person(
          id: map['id_person'] as int,
          name: map['person_name'] as String,
          job: map['job'] as String?,
          address: map['address'] as String,
          email: map['email'] as String?,
          telephone: telps);
    }

    return person;
  }
}
