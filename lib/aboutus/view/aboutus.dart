// import 'package:flutter/material.dart';

// class AboutUsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('About Us'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'About Us',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'We are a service provider dedicated to enhancing the lives of our clients through a range of supportive and compassionate services.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Our Services',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Personal Care:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'We provide assistance with daily activities to ensure our clients maintain their dignity and independence.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Home Care:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Our home care services include cleaning, meal preparation, and other household tasks to create a comfortable living environment.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Laundry Service:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'We manage laundry needs with care and attention to detail, ensuring clothes are clean and well-maintained.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Shopping Service:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Our shopping service supports clients in managing their grocery and personal shopping needs efficiently and conveniently.',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),),
//       ));
//   }}
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to Our Service',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'We are a service provider dedicated to enhancing the lives of our clients through a range of supportive and compassionate services.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildServiceCard(
                    icon: Icons.person_outline,
                    title: 'Personal Care',
                    description:
                        'We provide assistance with daily activities to ensure our clients maintain their dignity and independence.',
                    color: Colors.blue,
                  ),
                  _buildServiceCard(
                    icon: Icons.home_outlined,
                    title: 'Home Care',
                    description:
                        'Our home care services include cleaning, meal preparation, and other household tasks to create a comfortable living environment.',
                    color: Colors.green,
                  ),
                  _buildServiceCard(
                    icon: Icons.local_laundry_service_outlined,
                    title: 'Laundry Service',
                    description:
                        'We manage laundry needs with care and attention to detail, ensuring clothes are clean and well-maintained.',
                    color: Colors.purple,
                  ),
                  _buildServiceCard(
                    icon: Icons.shopping_cart_outlined,
                    title: 'Shopping Service',
                    description:
                        'Our shopping service supports clients in managing their grocery and personal shopping needs efficiently and conveniently.',
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
