import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetSnackBar snackBar(String title, bool status) {
  return GetSnackBar(
    duration: const Duration(seconds: 2),
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    borderRadius: 20.0,
    backgroundColor: Colors.grey[50]!,
    snackPosition: SnackPosition.TOP,
    titleText: Text(status ? "${title.capitalize} tersimpan" : "${title.capitalize} tidak tersimpan",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15.0,
          color: Colors.grey[800],)
    ),
    messageText: Text(status ?
      "Berhasil menyimpan $title yang diberikan" : "$title yang diberikan tidak valid",
      style: TextStyle(
        fontSize: 12.5,
        color: Colors.grey[600],),
    ),
    icon: CircleAvatar(
        backgroundColor: status ? Colors.green[50] : Colors.red[50],
        child: Icon(
          Icons.check_circle_rounded,
          color: status ? Colors.green : Colors.red,
        )),
  );
}