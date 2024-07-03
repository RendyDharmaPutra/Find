import 'package:contact_app/component/button.dart';
import 'package:contact_app/component/field.dart';
import 'package:contact_app/component/snackbar.dart';
import 'package:contact_app/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class EditPerson extends StatelessWidget {
  EditPerson({super.key});
  final _formKey = GlobalKey<FormBuilderState>();
  final int idPerson = Get.arguments['idPerson'];

  Future<void> saveData() async {
    if (_formKey.currentState!.validate()) {
      Map<String, Object?> dataPerson = Map<String, Object?>.from(_formKey.currentState!.instantValue);

      int result = await Get.find<ProfileController>().updatePerson(dataPerson);

      if (result > 0) {
        Get.showSnackbar(snackBar("Profil", true));
      }
    } else {
      Get.showSnackbar(snackBar("Profil", false));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Profil"),
        leading: IconButton(
            onPressed: () {
              Get.offNamed('/detail', arguments: {'idPerson': idPerson});
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: GetBuilder<ProfileController>(
                init: ProfileController(idPerson: idPerson),
                builder: (controller) {
                  return controller.person == null ? const CircularProgressIndicator() : Column(
                    children: <Widget>[
                      field(context, label: true, title: "nama", name: 'person_name', value: controller.person!.name),
                      field(context, label: true, title: "pekerjaan", name: 'job', value: controller.person!.job),
                      field(context, label: true, title: "alamat", name: 'address', value: controller.person!.address),
                      field(context, label: true, title: "email", name: 'email', value: controller.person!.email),
                      const SizedBox(
                        height: 25,
                      ),
                      saveButton(context, 'Simpan Profil', saveData),
                    ],
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
