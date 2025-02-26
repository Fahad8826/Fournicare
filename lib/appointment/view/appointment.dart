// import 'package:flutter/material.dart';
// import 'package:fourincare/appointment/controller/app_controller.dart';
// import 'package:fourincare/chat_scren/view/chat_creen.dart';
// import 'package:get/get.dart';

// class AppointmentListPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appc = Get.put(AppointmentController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appointment Details'),
//       ),
//       body: GetBuilder<AppointmentController>(
//         initState: (state) {
//           appc.getValue();
//         },
//         builder: (controller) {
//           return appc.appList.isEmpty
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   itemCount: appc.appList.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text('${appc.appList[index]['name']} '),
//                       subtitle: Text(
//                           'Service:${appc.appList[index]['service']}\n address: ${appc.appList[index]['adss']}\nDate: ${appc.appList[index]['date']}\nTime: ${appc.appList[index]['time']}'),
//                       trailing: IconButton(
//                           onPressed: () {
//                             Get.to(ChatScreen(
//                               id: appc.appList[index]['person']['id'],
//                             ));
//                           },
//                           icon: Icon(Icons.chat)),
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fourincare/appointment/controller/app_controller.dart';
import 'package:fourincare/chat_scren/view/chat_creen.dart';
import 'package:get/get.dart';

class AppointmentListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appc = Get.put(AppointmentController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Appointment Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GetBuilder<AppointmentController>(
        initState: (state) {
          appc.getValue();
        },
        builder: (controller) {
          if (appc.appList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: appc.appList.length,
            itemBuilder: (context, index) {
              final appointment = appc.appList[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appointment['name']?.toString() ?? 'No Name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (appointment['person'] != null &&
                                  appointment['person']['id'] != null) {
                                Get.to(ChatScreen(
                                  id: appointment['person']['id'],
                                ));
                              }
                            },
                            icon: const Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        Icons.medical_services_outlined,
                        'Service',
                        appointment['service']?.toString() ?? 'Not specified',
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.location_on_outlined,
                        'Address',
                        appointment['adss']?.toString() ??
                            'No address provided',
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.description_outlined,
                        'Description',
                        appointment['desc']?.toString() ?? 'No description',
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.phone_outlined,
                        'Phone',
                        appointment['phone']?.toString() ?? 'No phone provided',
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.person_outline,
                        'Age',
                        appointment['age']?.toString() ?? 'Not specified',
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: _buildInfoRow(
                              Icons.calendar_today_outlined,
                              'Date',
                              appointment['date']?.toString() ?? 'Not set',
                            ),
                          ),
                          Expanded(
                            child: _buildInfoRow(
                              Icons.access_time_outlined,
                              'Time',
                              appointment['time']?.toString() ?? 'Not set',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
