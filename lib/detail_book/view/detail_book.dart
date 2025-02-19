import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fourincare/confirmation/view/confirmation.dart';
import 'package:get/get.dart';

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

  bool? cab = false;

  // final TextEditingController _dropAddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Appointment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: _ageController,
                      decoration: InputDecoration(labelText: 'Age'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: _phonController,
                      decoration: InputDecoration(labelText: 'phone'),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration:
                          InputDecoration(labelText: 'Description of Service'),
                    ),
                    TextField(
                      controller: _dateController,
                      decoration: InputDecoration(labelText: 'Date'),
                      keyboardType: TextInputType.datetime,
                      onTap: () {
                        selectDate(context);
                      },
                    ),
                    TextField(
                      controller: _timeController,
                      decoration: InputDecoration(labelText: 'Time'),
                      keyboardType: TextInputType.datetime,
                    ),
                    TextField(
                      controller: _pickupAddressController,
                      decoration:
                          InputDecoration(labelText: 'Address of patient'),
                    ),
                    widget.servName == 'Transportation'
                        ? Row(
                            children: [
                              Checkbox(
                                value: cab,
                                onChanged: (value) {
                                  setState(() {
                                    cab = value!;
                                  });
                                },
                              ),
                              Text('Do  you need Cab service')
                            ],
                          )
                        : SizedBox(),
                    // TextField(
                    //   controller: _dropAddressController,
                    //   decoration: InputDecoration(labelText: 'Address of Drop'),
                    // ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Process the data
                          print('Name: ${_nameController.text}');
                          print('Age: ${_ageController.text}');
                          print('Description: ${_descriptionController.text}');
                          print('Date: ${_dateController.text}');
                          print('Time: ${_timeController.text}');
                          print(
                              'Pickup Address: ${_pickupAddressController.text}');
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
                          final DocumentReference teacherDocument =
                              FirebaseFirestore.instance.collection('user').doc(
                                  FirebaseAuth.instance.currentUser!.email
                                      .toString());
                          final DocumentReference dytyDocument =
                              FirebaseFirestore.instance
                                  .collection('ad_duty')
                                  .doc('duty');
                          final DocumentReference sdocumrnt = FirebaseFirestore
                              .instance
                              .collection('s_person')
                              .doc('${widget.person['id']}');
                          final DocumentSnapshot dat =
                              await teacherDocument.get();
                          final DocumentSnapshot dat2 =
                              await dytyDocument.get();

                          final Map<String, dynamic> fbval =
                              dat.data() as Map<String, dynamic>;
                          final Map<String, dynamic> fbval2 =
                              dat2.data() as Map<String, dynamic>;

                          List loclist = fbval['appon'];

                          List loclist2 = fbval2['appon'];
                          loclist.add(val);
                          loclist2.add(val);

                          fbval['appon'] = loclist;
                          fbval2['appon'] = loclist2;

                          log('${fbval}');
                          await teacherDocument.update(fbval);
                          await dytyDocument.update(fbval2);
                          await sdocumrnt.update({
                            'duty': FieldValue.arrayUnion([val])
                          });
                          // print('Drop Address: ${_dropAddressController.text}');
                          Get.to(Confirmation(
                            adss: _pickupAddressController.text,
                            date: _dateController.text,
                            naem: _nameController.text,
                            phone: _phonController.text,
                            sername: widget.servName,
                            time: _timeController.text,
                          ));
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
