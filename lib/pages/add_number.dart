import 'package:contact_app/component/button.dart';
import 'package:contact_app/component/snackbar.dart';
import 'package:contact_app/component/telp.dart';
import 'package:contact_app/utils/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AddNumber extends StatelessWidget {
  AddNumber({super.key});
  final _formKey = GlobalKey<FormBuilderState>();
  final int personId = Get.arguments['personId'];

  Future<void> saveData() async {
    if (_formKey.currentState!.validate()) {
      Map<String, Object?> dataTelephone = Map<String, Object?>.from(_formKey.currentState!.instantValue);
      dataTelephone['person_id'] = personId;

      int result = await insertData('Telephone', dataTelephone);

      if(result > 0) {
        Get.showSnackbar(snackBar("Nomor", true));
      }
    } else {
      Get.showSnackbar(snackBar("Nomor", false));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tambah Nomor"),
          leading: IconButton(
              onPressed: () {
                Get.offNamed('/detail', arguments: {'idPerson': personId});
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              number(context, label: false),
              const SizedBox(
                height: 25,
              ),
              saveButton(context, 'Simpan Nomor', saveData),
            ],
          ),
        ),
      ),
    );
  }
}
