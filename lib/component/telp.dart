import 'package:contact_app/component/field.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

Column number(BuildContext context, {required bool label, List<String> value = const []}) {
  return (Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      label ? const Text("Telepon") : const SizedBox.shrink(),
      label ? const SizedBox(height: 5,) : const SizedBox.shrink(),
      field(context, label: !label, title: "nama telepon", name: 'telephone_name', value: value.isNotEmpty ? value[0] : null),
      field(context, label: !label, title: "nomor telepon", name: 'telephone_number', value: value.isNotEmpty ? value[1] : null),
    ],
  ));
}
