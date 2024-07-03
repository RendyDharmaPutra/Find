import 'package:flutter/material.dart';
import 'package:get/get.dart';

AlertDialog confirmDialog(BuildContext context, String title, void Function() action) {
  return AlertDialog(
    backgroundColor: Colors.white,
    title: Text("Hapus $title", style: Theme.of(context).textTheme.headlineMedium,),
    content: Text("Apakah anda yakin ingin menghapus $title ini?",
      style: Theme.of(context).textTheme.titleMedium),
    actions: [
      TextButton(onPressed: () => Get.back(),
          style: TextButton.styleFrom(foregroundColor: Colors.grey[900]),
          child: const Text("Batal")),
      TextButton(onPressed: action,
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text("Hapus")),
    ],
  );
}