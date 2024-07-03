import 'package:contact_app/component/theme_data.dart';
import 'package:contact_app/pages/add_contact.dart';
import 'package:contact_app/pages/add_number.dart';
import 'package:contact_app/pages/contact_detail.dart';
import 'package:contact_app/pages/edit_number.dart';
import 'package:contact_app/pages/edit_person.dart';
import 'package:contact_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData(),
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/add', page: () => AddContact()),
        GetPage(name: '/detail', page: () => Detail()),
        GetPage(name: '/addNumber', page: () => AddNumber()),
        GetPage(name: '/editNumber', page: () => EditNumber()),
        GetPage(name: '/editPerson', page: () => EditPerson())
      ],
      initialRoute: '/',
    );
  }
}

