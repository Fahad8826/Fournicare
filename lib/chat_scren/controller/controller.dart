import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  List<dynamic> messages = [];
  Future<void> sendMessage(String personId, String message) async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection('s_person').doc(personId);
    log('${document.get()}');
    final DocumentSnapshot dt = await document.get();
    final val = dt.data();
    log('${dt.data()}');
    // log('${((val as Map)['chat'][FirebaseAuth.instance.currentUser!.email])}');
    List lList = [];
    lList =
        ((val as Map)['chat'][FirebaseAuth.instance.currentUser!.email]) ?? [];

    final Map<String, dynamic> msg = {
      'isUser': true,
      'message': message,
      'time': DateTime.now().toString(),
    };
    log('${lList}');
    lList.add(msg);
    final Map<String, dynamic> sm = {
      '${FirebaseAuth.instance.currentUser!.email}': lList
    };
    await document.update({'chat': sm});
  }

  Future<void> fetchMessages(String personId) async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection('s_person').doc(personId);
    DocumentSnapshot snapshot = await document.get();
    final val = snapshot.data();
    if (snapshot.exists) {
      messages = ((val as Map)['chat']
              [FirebaseAuth.instance.currentUser!.email]) ??
          [];
          log('${messages}');
    } else {}
    update();
  }
}
