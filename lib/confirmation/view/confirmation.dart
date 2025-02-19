// import 'package:drbook/screen/appointment/view/appointment.dart';
// import 'package:drbook/screen/appointment/view/widget/appbar.dart';
// import 'package:drbook/screen/confirmation/controller/confirmation_controller.dart';
// import 'package:drbook/screen/my_bookings/view/my_booking.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fourincare/appointment/view/appointment.dart';
import 'package:fourincare/confirmation/controller/confirmation_contro.dart';
import 'package:fourincare/home/view/home.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Confirmation extends StatelessWidget {
  const Confirmation(
      {super.key,
      required this.sername,
      required this.time,
      required this.date,
      required this.naem,
      required this.phone,
      required this.adss});
  final String sername;
  final String time;
  final String date;
  final String naem;
  final String phone;
  final String adss;

  @override
  Widget build(BuildContext context) {
    // const String lottieAssetPath = 'assets/lottie/animation_lmrxr53d.json';
    // final contro = Get.put(ConfirmationController());
    // contro.getApiValue();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // AppBarC(tex: 'Confirmation'),
                  // SizedBox(height:Get.height*0.05 ,),
                  SizedBox(
                    width: Get.width * 0.6, // Set the width and height
                    height: Get.height * 0.28,
                    child: Lottie.network(
                      'https://lottie.host/a72c33fa-7674-4ab4-aa12-aa4735abd56d/9CBV6CLp7S.json',
                      fit: BoxFit.fitHeight, // Replace with your asset path
                    ),
                  ),
                  Text(
                    'Appointment Confirmed!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Text(
                    'You have successfully booked appointment For',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 118, 117, 117)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$sername'
                    // contro.confirmationValue.doctorName
                    ,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(children: [
                    SvgPicture.asset(
                      'assets/image/person.svg',
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 6, 130, 231), BlendMode.srcIn),
                      height: 28,
                    ),
                    Text('$naem',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(children: [
                      SvgPicture.asset(
                        'assets/image/calender.svg',
                        colorFilter: ColorFilter.mode(
                            Color.fromARGB(255, 6, 130, 231), BlendMode.srcIn),
                        height: 28,
                      ),
                      Text(' $date ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: Get.width * 0.1,
                      ),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/image/timer-1.svg',
                          colorFilter: ColorFilter.mode(
                              Color.fromARGB(255, 6, 130, 231),
                              BlendMode.srcIn),
                          height: 28,
                        ),
                        Text(
                            // 'kk'
                            time,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                      ])
                    ]),
                  )
                ]),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: Get.width,
                  child: Column(children: [
                    SizedBox(
                      height: Get.height * 0.023,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(AppointmentListPage());
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          'view Appointments',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                        width: Get.width * 0.85,
                        height: Get.height * 0.06,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 6, 130, 231),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.023,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(Home());
                        },
                        child: Text(
                          'Book Another',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ))
                  ]),
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      border: Border.all(
                          color: Color.fromARGB(255, 202, 202, 202),
                          width: 1.4)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
