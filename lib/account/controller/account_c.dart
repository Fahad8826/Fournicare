import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  String email = '';
  String fname = '';
  String lname = '';
  void getValue() async {
    fname = '';
    lname = '';
    email = '';
    log('called');
    final DocumentReference teacherDocument = FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.email.toString());
    final DocumentSnapshot dat = await teacherDocument.get();
    final Map<String, dynamic> fbval = dat.data() as Map<String, dynamic>;
    email = fbval['email'];
    fname = fbval['fname'];
    lname = fbval['lname'];
    log('called2 $fname');
    update();
  }
}
