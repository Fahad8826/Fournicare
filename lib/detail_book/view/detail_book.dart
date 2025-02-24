// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fourincare/confirmation/view/confirmation.dart';
// import 'package:get/get.dart';

// class DetailsAndBook extends StatefulWidget {
//   const DetailsAndBook(
//       {super.key, required this.servName, required this.person});
//   final String servName;
//   final Map person;

//   @override
//   State<DetailsAndBook> createState() => _DetailsAndBookState();
// }

// class _DetailsAndBookState extends State<DetailsAndBook> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _timeController = TextEditingController();
//   final TextEditingController _pickupAddressController =
//       TextEditingController();
//   final TextEditingController _phonController = TextEditingController();
//   DateTime? _selectedDate;

//   Future<void> selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (pickedDate != null && pickedDate != _selectedDate) {
//       setState(() {
//         _selectedDate = pickedDate;
//         _dateController.text = pickedDate.toString().substring(0, 11);
//       });
//     }
//   }

//   bool? cab = false;

//   // final TextEditingController _dropAddressController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book a Appointment'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: _nameController,
//                       decoration: InputDecoration(labelText: 'Name'),
//                     ),
//                     TextField(
//                       controller: _ageController,
//                       decoration: InputDecoration(labelText: 'Age'),
//                       keyboardType: TextInputType.number,
//                     ),
//                     TextField(
//                       controller: _phonController,
//                       decoration: InputDecoration(labelText: 'phone'),
//                       keyboardType: TextInputType.number,
//                       maxLength: 10,
//                     ),
//                     TextField(
//                       controller: _descriptionController,
//                       decoration:
//                           InputDecoration(labelText: 'Description of Service'),
//                     ),
//                     TextField(
//                       controller: _dateController,
//                       decoration: InputDecoration(labelText: 'Date'),
//                       keyboardType: TextInputType.datetime,
//                       onTap: () {
//                         selectDate(context);
//                       },
//                     ),
//                     TextField(
//                       controller: _timeController,
//                       decoration: InputDecoration(labelText: 'Time'),
//                       keyboardType: TextInputType.datetime,
//                     ),
//                     TextField(
//                       controller: _pickupAddressController,
//                       decoration:
//                           InputDecoration(labelText: 'Address of patient'),
//                     ),
//                     widget.servName == 'Transportation'
//                         ? Row(
//                             children: [
//                               Checkbox(
//                                 value: cab,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     cab = value!;
//                                   });
//                                 },
//                               ),
//                               Text('Do  you need Cab service')
//                             ],
//                           )
//                         : SizedBox(),

//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           // Process the data
//                           print('Name: ${_nameController.text}');
//                           print('Age: ${_ageController.text}');
//                           print('Description: ${_descriptionController.text}');
//                           print('Date: ${_dateController.text}');
//                           print('Time: ${_timeController.text}');
//                           print(
//                               'Pickup Address: ${_pickupAddressController.text}');
//                           Map<String, dynamic> val = {
//                             'name': _nameController.text,
//                             'age': _ageController.text,
//                             'phone': _phonController.text,
//                             'adss': _pickupAddressController.text,
//                             'desc': _descriptionController.text,
//                             'date': _dateController.text,
//                             'time': _timeController.text,
//                             'service': widget.servName,
//                             'person': widget.person,
//                             'cab': cab
//                           };
//                           final DocumentReference teacherDocument =
//                               FirebaseFirestore.instance.collection('user').doc(
//                                   FirebaseAuth.instance.currentUser!.email
//                                       .toString());
//                           final DocumentReference dytyDocument =
//                               FirebaseFirestore.instance
//                                   .collection('ad_duty')
//                                   .doc('duty');
//                           final DocumentReference sdocumrnt = FirebaseFirestore
//                               .instance
//                               .collection('s_person')
//                               .doc('${widget.person['id']}');
//                           final DocumentSnapshot dat =
//                               await teacherDocument.get();
//                           final DocumentSnapshot dat2 =
//                               await dytyDocument.get();

//                           final Map<String, dynamic> fbval =
//                               dat.data() as Map<String, dynamic>;
//                           final Map<String, dynamic> fbval2 =
//                               dat2.data() as Map<String, dynamic>;

//                           List loclist = fbval['appon'];

//                           List loclist2 = fbval2['appon'];
//                           loclist.add(val);
//                           loclist2.add(val);

//                           fbval['appon'] = loclist;
//                           fbval2['appon'] = loclist2;

//                           log('${fbval}');
//                           await teacherDocument.update(fbval);
//                           await dytyDocument.update(fbval2);
//                           await sdocumrnt.update({
//                             'duty': FieldValue.arrayUnion([val])
//                           });
//                           // print('Drop Address: ${_dropAddressController.text}');
//                           Get.to(Confirmation(
//                             adss: _pickupAddressController.text,
//                             date: _dateController.text,
//                             naem: _nameController.text,
//                             phone: _phonController.text,
//                             sername: widget.servName,
//                             time: _timeController.text,
//                           ));
//                         }
//                       },
//                       child: Text('Submit'),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// new code
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fourincare/confirmation/view/confirmation.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsAndBook extends StatefulWidget {
  const DetailsAndBook(
      {super.key, required this.servName, required this.person});
  final String servName;
  final Map person;

  @override
  State<DetailsAndBook> createState() => _DetailsAndBookState();
}

class _DetailsAndBookState extends State<DetailsAndBook> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _pickupAddressController =
      TextEditingController();
  final TextEditingController _phonController = TextEditingController();
  DateTime? _selectedDate;
  bool? cab = false;
  bool _isLoading = false;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = pickedDate.toString().substring(0, 11);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Book an Appointment',
          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Information',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue.shade400),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          prefixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _phonController,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          counterText: "",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Appointment Details',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description of Service Needed',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: () => selectDate(context),
                        decoration: InputDecoration(
                          labelText: 'Date',
                          prefixIcon: const Icon(Icons.event),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _timeController,
                        decoration: InputDecoration(
                          labelText: 'Time',
                          prefixIcon: const Icon(Icons.access_time),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _pickupAddressController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Address of Patient',
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                ),
                if (widget.servName == 'Transportation') ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: cab,
                          onChanged: (value) {
                            setState(() {
                              cab = value!;
                            });
                          },
                          activeColor: Colors.blue.shade400,
                        ),
                        const Text(
                          'Do you need Cab service?',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 11, 50, 205),
                          Color.fromARGB(255, 84, 102, 179),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null 
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  String? userEmail =
                                      FirebaseAuth.instance.currentUser?.email;
                                  if (userEmail == null) {
                                    Get.snackbar(
                                        "Error", "User not authenticated");
                                    return;
                                  }

                                  Map<String, dynamic> val = {
                                    'name': _nameController.text,
                                    'age': _ageController.text,
                                    'phone': _phonController.text,
                                    'adss': _pickupAddressController.text,
                                    'desc': _descriptionController.text,
                                    'date': _dateController.text,
                                    'time': _timeController.text,
                                    'service': widget.servName,
                                    'person': widget.person,
                                    'cab': cab
                                  };

                                  final DocumentReference userDoc =
                                      FirebaseFirestore.instance
                                          .collection('user')
                                          .doc(userEmail);
                                  final DocumentReference dutyDoc =
                                      FirebaseFirestore.instance
                                          .collection('ad_duty')
                                          .doc('duty');
                                  final DocumentReference personDoc =
                                      FirebaseFirestore.instance
                                          .collection('s_person')
                                          .doc(widget.person['id'].toString());

                                  final DocumentSnapshot userSnap =
                                      await userDoc.get();
                                  final DocumentSnapshot dutySnap =
                                      await dutyDoc.get();

                                  final Map<String, dynamic> userData = userSnap
                                          .data() as Map<String, dynamic>? ??
                                      {};
                                  final Map<String, dynamic> dutyData = dutySnap
                                          .data() as Map<String, dynamic>? ??
                                      {};

                                  List userAppointments =
                                      userData['appon'] ?? [];
                                  List dutyAppointments =
                                      dutyData['appon'] ?? [];

                                  userAppointments.add(val);
                                  dutyAppointments.add(val);

                                  userData['appon'] = userAppointments;
                                  dutyData['appon'] = dutyAppointments;

                                  await userDoc.update(userData);
                                  await dutyDoc.update(dutyData);
                                  await personDoc.update({
                                    'duty': FieldValue.arrayUnion([val])
                                  });

                                  Get.to(Confirmation(
                                    adss: _pickupAddressController.text,
                                    date: _dateController.text,
                                    naem: _nameController.text,
                                    phone: _phonController.text,
                                    sername: widget.servName,
                                    time: _timeController.text,
                                  ));
                                } catch (e) {
                                  Get.snackbar("Error", "Failed to submit: $e");
                                }
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Submit',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
