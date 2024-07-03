import 'package:contact_app/model/telephone.dart';
import 'package:contact_app/utils/db.dart';
import 'package:get/get.dart';

class NumberController extends GetxController {
    Telephone? telephone;
    final int idTelephone;

    NumberController({required this.idTelephone}) {
      getTelephone();
    }

    Future<void> getTelephone() async {
      List<Map<String, Object?>> dataTelephone = await getData(table: 'Telephone', search: 'id_telephone', id: idTelephone);


      telephone = Telephone.fromMap(dataTelephone[0]);
      update();
    }

    Future<int> updateTelephone(Map<String, Object?> data) async {
      int result = await updateData('Telephone', data, 'id_telephone', telephone!.id);

      return result;
    }

    Future<int> deleteTelephone() async {
      int result = await deleteData('Telephone', 'id_telephone', telephone!.id);

      return result;
    }
}