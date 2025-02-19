import 'package:flutter/material.dart';
import 'package:fourincare/appointment/controller/app_controller.dart';
import 'package:fourincare/chat_scren/view/chat_creen.dart';
import 'package:get/get.dart';

class AppointmentListPage extends StatelessWidget {
  // final List<Map<String, String>> appointments = [
  //   {
  //     'firstName': 'John',
  //     'lastName': 'Doe',
  //     'email': 'john.doe@example.com',
  //     'date': '2025-02-15',
  //     'time': '10:00 AM',
  //   },
  //   {
  //     'firstName': 'Jane',
  //     'lastName': 'Smith',
  //     'email': 'jane.smith@example.com',
  //     'date': '2025-02-16',
  //     'time': '11:00 AM',
  //   },
  // Add more appointments as needed
//  ];

  @override
  Widget build(BuildContext context) {
    final appc = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: GetBuilder<AppointmentController>(
        initState: (state) {
          appc.getValue();
        },
        builder: (controller) {
          return appc.appList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: appc.appList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${appc.appList[index]['name']} '),
                      subtitle: Text(
                          'Service:${appc.appList[index]['service']}\n address: ${appc.appList[index]['adss']}\nDate: ${appc.appList[index]['date']}\nTime: ${appc.appList[index]['time']}'),
                      trailing: IconButton(
                          onPressed: () {
                            Get.to(ChatScreen(
                              id: appc.appList[index]['person']['id'],
                            ));
                          },
                          icon: Icon(Icons.chat)),
                    );
                  },
                );
        },
      ),
    );
  }
}
