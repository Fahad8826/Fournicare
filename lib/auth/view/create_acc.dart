import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fourincare/home/view/home.dart';
import 'package:get/get.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      UserCredential cres = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text);
                      log(cres.user!.email.toString());
                      final DocumentReference teacherDocument =
                          FirebaseFirestore.instance
                              .collection('user')
                              .doc(cres.user!.email.toString());
                      // final DocumentReference restodocument = FirebaseFirestore
                      //     .instance
                      //     .collection('RestoDeteails')
                      //     .doc(pin.text.toString());
                      // Map<String, dynamic> val = {
                      //   'loction': pin.text.toString()
                      // };
                      // String? dateString =
                      //     await WorldTimeService()
                      //         .getCurrentIndianTime();
                      // DateTime date = DateTime.parse(dateString!);
                      // DateTime nextMonth =
                      //     DateTime(date.year, date.month + 1, 1);
                      // DateTime nextMonthlasdue =
                      //     DateTime(date.year, date.month + 1, 5);
                      Map<String, dynamic> deteails = {
                        'fname': _firstNameController.text,
                        'lname': _lastNameController.text,
                        'email': _emailController.text,
                        'password': _passwordController.text,
                        'appon': []
                      };
                      // await restodocument
                      //     .set({
                      //       'restodeteails': FieldValue.arrayUnion([deteails])
                      //     }, SetOptions(merge: true))
                      //     .then((_) {})
                      //     .catchError((error) {
                      //       if (kDebugMode) {
                      //         print("Error adding/updating data: $error");
                      //       }
                      //     });
                      // await restodocument.update({
                      //   'restodeteails':
                      //       FieldValue.arrayUnion([Deteails])
                      // });

                      await teacherDocument
                          .set(deteails, SetOptions(merge: true))
                          .then((_) {})
                          .catchError((error) {
                        // if (kDebugMode) {
                        //   print("Error adding/updating data: $error");
                        // }
                      });
                      // controller.isLoding(true);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>  Home(
                                // check: true,
                                ),
                          ),
                          (route) => true);
                    } on FirebaseAuthException catch (e) {
                      if (e.toString().contains(
                          'The email address is already in use by another account')) {
                        Get.defaultDialog(
                          titleStyle: const TextStyle(color: Colors.red),
                          title: 'Email In Use',
                          content: const Text(
                              'The email address is already in use by another account.'),
                        );
                        // controller.isLoding(controller.isFetch);
                      } else if (e.toString().contains(
                          'Password should be at least 6 characters')) {
                        Get.defaultDialog(
                          titleStyle: const TextStyle(color: Colors.red),
                          title: 'Password Too Short',
                          content: const Text(
                              'Password should be at least 6 characters long.'),
                        );
                        // controller.isLoding(controller.isFetch);
                      }
                      // controller.isLoding(true);
                      log(e.toString());
                    }
                    // Process the data
                    print('First Name: ${_firstNameController.text}');
                    print('Last Name: ${_lastNameController.text}');
                    print('Email: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
