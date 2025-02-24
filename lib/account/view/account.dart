// import 'package:flutter/material.dart';
// import 'package:fourincare/account/controller/account_c.dart';
// import 'package:get/get.dart';

// class AccountDetailsPage extends StatelessWidget {
//   final String firstName = "John";
//   final String lastName = "Doe";
//   final String email = "john.doe@example.com";

//   @override
//   Widget build(BuildContext context) {
//     final accC = Get.put(AccountController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Account Details'),
//         backgroundColor: Colors.teal,
//       ),
//       body: GetBuilder<AccountController>(
//         initState: (state) {
//           accC.getValue();
//         },
//         builder: (controller) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Card(
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: AssetImage(
//                             'assets/profile_image.png'), // Change this path to your profile image path
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     ListTile(
//                       leading: Icon(Icons.person),
//                       title: Text(
//                         'First Name: ${accC.fname}',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.person_outline),
//                       title: Text(
//                         'Last Name: ${accC.lname}',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.email),
//                       title: Text(
//                         'Email: ${accC.email}',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fourincare/account/controller/account_c.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accC = Get.put(AccountController());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black87),
            onPressed: () {
              // Add edit profile functionality
            },
          ),
        ],
      ),
      body: GetBuilder<AccountController>(
        initState: (state) {
          accC.getValue();
        },
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Profile Header Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue.shade100,
                                width: 5,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.blue.shade50,
                              backgroundImage:
                                  const AssetImage('assets/profile_image.png'),
                              child: const Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${accC.fname} ${accC.lname}',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        accC.email,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Profile Details Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildProfileTile(
                        icon: Icons.person,
                        title: 'First Name',
                        value: accC.fname,
                      ),
                      _buildProfileTile(
                        icon: Icons.person_outline,
                        title: 'Last Name',
                        value: accC.lname,
                      ),
                      _buildProfileTile(
                        icon: Icons.email_outlined,
                        title: 'Email',
                        value: accC.email,
                      ),
                      const SizedBox(height: 20),

                      // Additional Actions
                      _buildActionButton(
                        icon: Icons.security,
                        title: 'Security Settings',
                        onTap: () {
                          // Add security settings navigation
                        },
                      ),
                      _buildActionButton(
                        icon: Icons.notifications_outlined,
                        title: 'Notifications',
                        onTap: () {
                          // Add notifications navigation
                        },
                      ),
                      _buildActionButton(
                        icon: Icons.help_outline,
                        title: 'Help & Support',
                        onTap: () {
                          // Add help & support navigation
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
