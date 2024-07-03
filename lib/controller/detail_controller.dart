import 'package:contact_app/model/person.dart';
import 'package:contact_app/utils/db.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class DetailController extends GetxController {
  Person? person;
  final int idPerson;

  DetailController({required this.idPerson}) {
    getPerson();
  }

  Future<void> getPerson() async {
    List<Map<String, Object?>> dataPerson = await getData(table: 'Person', search: 'id_person', id: idPerson);
    List<Map<String, Object?>> dataTelephone = await getData(table: 'Telephone', search: 'person_id', id: idPerson);

    // dataTelephone.isEmpty ? dataTelephone = [{'': null}] : dataTelephone;

    person = Person.fromMap(map: dataPerson[0], telp: dataTelephone);
    update();
  }

  Future<int> deletePerson() async {
    int result = await deleteData('Person', 'id_person', person!.id);
    person!.telephone!.isNotEmpty ? await deleteData('Telephone', 'person_id', person!.id) : null;

    return result;
  }
}