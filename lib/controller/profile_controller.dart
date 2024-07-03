import 'package:contact_app/model/person.dart';
import 'package:contact_app/utils/db.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Person? person;
  final int idPerson;

  ProfileController({required this.idPerson}) {
    getPerson();
  }

  Future<void> getPerson() async {
    List<Map<String, Object?>> dataPerson = await getData(table: 'Person', search: 'id_person', id: idPerson);

    person = Person.fromMap(map: dataPerson[0]);
    update();
  }

  Future<int> updatePerson(Map<String, Object?> dataPerson) async {
    int result = await updateData('Person', dataPerson, 'id_person', idPerson);

    return result;
  }
}