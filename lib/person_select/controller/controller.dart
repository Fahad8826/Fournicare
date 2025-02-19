import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PersonFetch extends GetxController{
   bool islodin = false;
  List<dynamic> catergorypeople = [];
  int checkindex = 0;
  Map<String, dynamic> persondetails = {};
  final List<String> servicesdb = [
    'Transportation',
    'Shopping',
    'Personal Assistant',
    'Hospital Companion',
    'Hygiene and Toileting',
    'Dressing Grooming',
    'Companionship',
    'Med Administration',
    'Meal preparing',
    'Laundry',
    'cleaning',
  ];
  int index = 0;
  void indexchange(int iindex) {
    index = iindex;
    update();
  }

  void personDetailsFetch() async {
    islodin = true;
    update();
    for (int i = 0; i < servicesdb.length; i++) {
      final DocumentReference teacherDocument = FirebaseFirestore.instance
          .collection('ad_ser')
          .doc('${servicesdb[i]}');
      final DocumentSnapshot dat = await teacherDocument.get();
      log('${(dat.data() as Map)['person']}');
      // List fbval = ((dat.data() as Map)['person']) as List;
      persondetails[servicesdb[i]] = ((dat.data() as Map)['person']) as List;
      log('${persondetails}');
    }
    update();
    categorIndex(0);
  }

  void categorIndex(int indexv) {
    islodin = true;
    update();
    catergorypeople.clear();
    checkindex = indexv;
    if (indexv == 0) {
      for (int i = 0; i < persondetails.values.toList().length; i++) {
        for (int j = 0;
            j < (persondetails.values.toList()[i] as List).length;
            j++) {
          catergorypeople.add(persondetails.values.toList()[i][j]);
        }
      }
    } else {
      catergorypeople = persondetails[servicesdb[indexv - 1]];
    }
    islodin = false;
    update();
  }
}