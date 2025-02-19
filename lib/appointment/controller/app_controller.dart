import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  List<dynamic> appList=[]; 
  void getValue() async {
    appList.clear();
    log('called');
    final DocumentReference teacherDocument = FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.email.toString());
    final DocumentSnapshot dat = await teacherDocument.get();
    final Map<String, dynamic> fbval = dat.data() as Map<String, dynamic>;
     appList = fbval['appon'];
     log('called2 $appList');
    update();
  }
}
