import 'package:flutter/material.dart';
import 'package:get/get.dart';

ListTile listTileContact(BuildContext context, {required String nav, required int id, required String title, required String subtitle}) {
  return(
      ListTile(
        onTap: () {
          nav == 'detail' ?
          Get.offNamed('/$nav', arguments: {'idPerson': id}) :
          Get.offNamed('/$nav', arguments: {'idTelephone': id});
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
        leading: nav == 'detail' ? CircleAvatar(backgroundColor: Colors.grey[400], child: const Icon(Icons.person_2_rounded, color: Colors.white)) : CircleAvatar(backgroundColor: Colors.green[50], child: const Icon(Icons.call, color: Colors.green,)),
        title: Text(title, style: Theme.of(context).textTheme.displayMedium,),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.displaySmall),
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400],),
      )
  );

}