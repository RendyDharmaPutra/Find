import 'package:contact_app/model/person.dart';
import 'package:contact_app/utils/db.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class Contacts extends GetxController {
  List<Person>? contactList;

  Contacts() {
    insertContacts();
  }

  Future<void> insertContacts() async {
    List<Map<String, Object?>> dataContacts = await getData(table: "Person", column: ["id_person", "person_name", "job", "address"]);

    if(dataContacts.isNotEmpty) {
      contactList = <Person>[];
      dataContacts.forEach((element) =>
          contactList!.add(
            Person.fromMap(map: element)
          )
      );
    }
    update();
  }

}