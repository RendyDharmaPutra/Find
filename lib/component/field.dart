import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

Column field(BuildContext context, {required String title, required String name, String? value, required bool label}) {
  List<String? Function(String?)> validate = [
    FormBuilderValidators.required(errorText: "Kolom $title harus diisi."),
  ];

  switch(name) {
    case 'address' || 'email':
      validate.add(FormBuilderValidators.maxLength(40, errorText: "${title.capitalize} tidak boleh lebih dari 40 karakter."));
      validate.add(FormBuilderValidators.minLength(7, errorText: "${title.capitalize} terlalu pendek." ));

      if(name == 'email') {
        validate.add(FormBuilderValidators.email(errorText: "Alamat email tidak valid."));
      }

    case 'telephone_number':
      validate.add(FormBuilderValidators.minLength(10, errorText: "${title.capitalize} terlalu pendek." ));
      validate.add(FormBuilderValidators.maxLength(15, errorText: "${title.capitalize} tidak boleh dari 15 karakter."));
      validate.add(FormBuilderValidators.integer(errorText: "Nomor telepon tidak valid."));

    default:
      validate.add(FormBuilderValidators.maxLength(20, errorText: "${title.capitalize} tidak boleh lebih dari 20 karakter."));
  }

  return(
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        label ? Text(title.capitalize!, style: Theme.of(context).textTheme.displayMedium,) : const SizedBox.shrink(),
        const SizedBox(height: 5,),
        FormBuilderTextField(initialValue: value ?? value, name: name, validator: FormBuilderValidators.compose(validate), decoration: decoration(context, title: title)),
        SizedBox(height: label ? 15 : 5,),
      ],
    )
  );
}

InputDecoration decoration(BuildContext context, {required String title}) {
  return(
      InputDecoration(
          hintText: "Masukkan $title",
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor)),
          focusColor: Colors.black,
          filled: true,
          fillColor: Colors.grey[100]
      )
  );
}
