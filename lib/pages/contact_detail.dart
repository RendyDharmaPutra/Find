import 'package:contact_app/component/dialog.dart';
import 'package:contact_app/component/list_tile.dart';
import 'package:contact_app/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  Detail({super.key});
  final int idPerson = Get.arguments['idPerson'];

  Future<void> deleteAction() async {
    int result = await Get.find<DetailController>().deletePerson();

    result >= 1 ? Get.offAllNamed('/') : null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.offNamed('/'), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        actions: <Widget> [
          IconButton(onPressed: () => Get.offNamed('/editPerson', arguments: {'idPerson': idPerson}),
              icon: const Icon(Icons.mode_edit_rounded)),
          IconButton(onPressed: () => Get.dialog(confirmDialog(context, "Kontak", deleteAction)),
              icon: const Icon(Icons.delete_rounded))
        ],
      ),
      body: GetBuilder<DetailController>(
        init: DetailController(idPerson: idPerson),
        builder: (detail) {
          return detail.person == null ? const Center(child: CircularProgressIndicator()) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(detail.person!.name, style: Theme.of(context).textTheme.titleLarge,),
                    const SizedBox(height: 5.0,),
                    Text(detail.person!.job!, style: Theme.of(context).textTheme.titleMedium,),
                    Text(detail.person!.address, style: Theme.of(context).textTheme.titleMedium,)
                  ],
                ),
              ),
              const Divider(indent: 25.0, endIndent: 25.0, thickness: 0.5,),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                leading: CircleAvatar(backgroundColor: Colors.blue[50], child: const Icon(Icons.email_rounded, color: Colors.blue,)),
                title: Text(detail.person!.email!, style: Theme.of(context).textTheme.displayMedium),
                // tileColor: Colors.black,
              ),
              const Divider(indent: 25.0, endIndent: 25.0, thickness: 0.5,),
              SingleChildScrollView(
                child: Column(
                  children: [
                    detail.person == null
                    ? const SizedBox.shrink()
                    : ListView.builder(itemCount: detail.person!.telephone!.length, shrinkWrap: true,
                        itemBuilder: (context, idx) => listTileContact(
                            context,
                            nav: 'editNumber',
                            id: detail.person!.telephone![idx].id,
                            title: detail.person!.telephone![idx].name,
                            subtitle: detail.person!.telephone![idx].number
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:  25.0, vertical: 20.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: OutlinedButton(onPressed: () => Get.offNamed('/addNumber', arguments: {'personId': detail.person!.id}), style: OutlinedButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColor,
                          side: BorderSide(color: Theme.of(context).primaryColor),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                        ),
                            child: const Text("Tambah Nomor")),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
