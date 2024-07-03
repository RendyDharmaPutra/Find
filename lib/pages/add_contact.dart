import 'package:contact_app/component/button.dart';
import 'package:contact_app/component/field.dart';
import 'package:contact_app/component/snackbar.dart';
import 'package:contact_app/component/telp.dart';
import 'package:contact_app/utils/db.dart';
import 'package:contact_app/utils/sliceMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AddContact extends StatelessWidget {
  AddContact({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> saveData() async {
    if (_formKey.currentState!.validate()) {
      Map<String, Object?> dataPerson = sliceMap(
          _formKey.currentState!.instantValue,
          ['telephone_name', 'telephone_number'],
          'drop');
      Map<String, Object?> dataTelephone = sliceMap(
          _formKey.currentState!.instantValue,
          ['telephone_name', 'telephone_number'],
          'elimination');

      int person = await insertData('Person', dataPerson);
      !person.isNegative ? dataTelephone['person_id'] = person : null;

      int result = await insertData('Telephone', dataTelephone);

      if (result > 0) {
        Get.showSnackbar(snackBar("kontak", true));
      }
    } else {
      Get.showSnackbar(snackBar("kontak", false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Kontak"),
        leading: IconButton(
            onPressed: () {
              Get.offNamed('/');
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                field(context, label: true, title: "nama", name: 'person_name'),
                field(context, label: true, title: "pekerjaan", name: 'job'),
                field(context, label: true, title: "alamat", name: 'address'),
                field(context, label: true, title: "email", name: 'email'),
                const SizedBox(
                  height: 10,
                ),
                number(context, label: true),
                const SizedBox(
                  height: 25,
                ),
                saveButton(context, 'Kontak', saveData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
