// import 'package:flutter/material.dart';

// class CustomerCarePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Customer Care'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Customer Care',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'We are here to help you with any questions, concerns, or issues you may have. Our customer care team is dedicated to providing you with the support you need.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Contact Information',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Phone: +91-123-456-7890',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Email: support@example.com',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Office Hours',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Monday to Friday: 9:00 AM - 6:00 PM',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               'Saturday: 10:00 AM - 4:00 PM',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               'Sunday: Closed',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'We look forward to assisting you!',
//               style: TextStyle(fontSize: 16),
//             ),])));
//   }}
import 'package:flutter/material.dart';

class CustomerCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Customer Care',
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
                    'How can we help you?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'We are here to help you with any questions, concerns, or issues you may have. Our customer care team is dedicated to providing you with the support you need.',
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
                  _buildContactSection(),
                  const SizedBox(height: 24),
                  _buildOfficeHoursSection(),
                  const SizedBox(height: 24),
                  _buildCallToAction(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              Icons.phone_outlined,
              'Phone',
              '+91-123-456-7890',
              Colors.blue,
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              Icons.email_outlined,
              'Email',
              'support@example.com',
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfficeHoursSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Office Hours',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildTimeRow('Monday to Friday', '9:00 AM - 6:00 PM'),
            _buildTimeRow('Saturday', '10:00 AM - 4:00 PM'),
            _buildTimeRow('Sunday', 'Closed', isClosed: true),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeRow(String day, String time, {bool isClosed = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isClosed ? Colors.red : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCallToAction() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.support_agent,
              color: Colors.blue,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'We look forward to assisting you!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
