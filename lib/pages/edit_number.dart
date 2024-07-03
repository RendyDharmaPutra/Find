import 'package:contact_app/component/button.dart';
import 'package:contact_app/component/dialog.dart';
import 'package:contact_app/component/snackbar.dart';
import 'package:contact_app/component/telp.dart';
import 'package:contact_app/controller/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class EditNumber extends StatelessWidget {
  EditNumber({super.key});
  final _formKey = GlobalKey<FormBuilderState>();
  final int idTelephone = Get.arguments['idTelephone'];

  Future<void> saveData() async {
    if (_formKey.currentState!.validate()) {
      Map<String, Object?> dataTelephone = Map<String, Object?>.from(_formKey.currentState!.instantValue);

      int result = await Get.find<NumberController>().updateTelephone(dataTelephone);

      if (result > 0) {
        Get.showSnackbar(snackBar("Nomor", true));
      }
    } else {
      Get.showSnackbar(snackBar("Nomor", false));
    }
  }

  Future<void> deleteAction() async {
    NumberController controller = Get.find<NumberController>();
    int result = await controller.deleteTelephone();

    result > 0 ? Get.offAllNamed('/detail', arguments: {'idPerson': controller.telephone!.personId}) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Nomor"),
        leading: IconButton(
            onPressed: () {
              Get.offNamed('/detail', arguments: {'idPerson': Get.find<NumberController>().telephone!.personId});
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        actions: <IconButton>[
          IconButton(onPressed: () => Get.dialog(confirmDialog(context,"Nomor Kontak",  deleteAction)), icon: const Icon(Icons.delete_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _formKey,
          child: GetBuilder<NumberController>(
            init: NumberController(idTelephone: idTelephone),
            builder: (controller) {
              return controller.telephone == null ? const CircularProgressIndicator() : Column(
                children: <Widget>[
                  number(context, label: false, value: [controller.telephone!.name, controller.telephone!.number]),
                  const SizedBox(
                    height: 25,
                  ),
                  saveButton(context, 'Simpan Nomor', saveData),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
