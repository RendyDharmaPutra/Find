import 'package:flutter/material.dart';

SizedBox saveButton(BuildContext context, String title, void Function() saveAction) {
  return SizedBox(
    width: double.infinity,
    height: 50.0,
    child: ElevatedButton(
      onPressed: saveAction,
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0))),
      child: const Text("Simpan Kontak"),
    ),
  );
}