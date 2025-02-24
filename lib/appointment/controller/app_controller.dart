// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class AppointmentController extends GetxController {
//   List<dynamic> appList=[]; 
//   void getValue() async {
//     appList.clear();
//     log('called');
//     final DocumentReference teacherDocument = FirebaseFirestore.instance
//         .collection('user')
//         .doc(FirebaseAuth.instance.currentUser!.email.toString());
//     final DocumentSnapshot dat = await teacherDocument.get();
//     final Map<String, dynamic> fbval = dat.data() as Map<String, dynamic>;
//      appList = fbval['appon'];
//      log('called2 $appList');
//     update();
//   }
// }
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  var appList = <Map<String, dynamic>>[].obs; // Reactive list
  var isLoading = true.obs; // Loading state

  @override
  void onInit() {
    super.onInit();
    getValue();
  }

  void getValue() async {
    try {
      isLoading.value = true;
      appList.clear();
      log('Fetching appointments...');

      final DocumentReference teacherDocument = FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.email.toString());

      final DocumentSnapshot dat = await teacherDocument.get();

      if (dat.exists) {
        final Map<String, dynamic>? fbval = dat.data() as Map<String, dynamic>?;

        if (fbval != null && fbval.containsKey('appon') && fbval['appon'] != null) {
          List<dynamic> fetchedAppointments = fbval['appon'];

          if (fetchedAppointments.isNotEmpty) {
            appList.assignAll(fetchedAppointments.cast<Map<String, dynamic>>());
          } else {
            log('No appointments found.');
            appList.clear();
          }
        } else {
          log('No "appon" key found in Firestore.');
          appList.clear();
        }
      } else {
        log('User document not found in Firestore.');
        appList.clear();
      }
    } catch (e) {
      log('Error fetching appointments: $e');
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
