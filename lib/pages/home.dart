import 'package:contact_app/component/list_tile.dart';
import 'package:contact_app/controller/contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Kontak"),
          actions: <Widget>[
            IconButton(
              onPressed: () => Get.offNamed('/add'),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: GetBuilder<Contacts>(
            init: Contacts(),
            builder: (contacts) {
              return contacts.contactList == null
            ? Center(child: Text("Belum ada kontak", style: Theme.of(context).textTheme.titleLarge))
            : contacts.contactList!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: contacts.contactList!.length,
                itemBuilder: (context, idx) => (listTileContact(
                    context,
                    nav: 'detail',
                    id: contacts.contactList![idx].id,
                    title: contacts.contactList![idx].name,
                    subtitle: contacts.contactList![idx].address
                ))
              );
            }
        )
    );
  }
}
