// import 'package:flutter/material.dart';
// import 'package:fourincare/detail_book/view/detail_book.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:fourincare/person_select/controller/controller.dart';
// import 'package:get/get.dart';

// class PersonGridView extends StatelessWidget {
//   final String servname;
//   final List<Map<String, dynamic>> people = [
//     {
//       'image':
//           'https://via.placeholder.com/150', // Replace with actual image URLs
//       'name': 'John Doe',
//       'age': 30,
//       'gender': 'Male',
//       'rate': '\$50/hr',
//       'rating': 4.5,
//     },
//     {
//       'image':
//           'https://via.placeholder.com/150', // Replace with actual image URLs
//       'name': 'Jane Smith',
//       'age': 25,
//       'gender': 'Female',
//       'rate': '\$45/hr',
//       'rating': 4.0,
//     },
//     // Add more people as needed
//   ];

//   PersonGridView({super.key, required this.servname});

//   @override
//   Widget build(BuildContext context) {
//     final perC = Get.put(PersonFetch());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//       ),
//       body: GetBuilder<PersonFetch>(
//         initState: (state) {
//           perC.personDetailsFetch();
//         },
//         builder: (controller) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: MediaQuery.sizeOf(context).width < 330 ? 1 : 2,
//                 childAspectRatio:
//                     MediaQuery.sizeOf(context).width < 330 ? 0.7 / 0.8 : .7,
//               ),
//               itemCount: perC.catergorypeople.length,
//               itemBuilder: (context, index) {
//                 final person = perC.catergorypeople[index];
//                 return Card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.network(
//                         person['pic'].toString(),
//                         height: 150,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Name: ${person['name']}',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Text('Age: ${person['age']}'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Text('Gender: ${person['gender']}'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: RatingBar.builder(
//                           itemSize: 15,
//                           initialRating: person['rating'] ?? 0.0,
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                           onRatingUpdate: (rating) {
//                             print('Rating updated to $rating');
//                           },
//                         ),
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                                 backgroundColor:
//                                     WidgetStatePropertyAll(Colors.green)),
//                             onPressed: () {
//                               // Handle select button press
//                               Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => DetailsAndBook(
//                                   servName: '${servname}',
//                                   person: person,
//                                 ),
//                               ));
//                               print('${person['name']} selected');
//                             },
//                             child: Text(
//                               'Select',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fourincare/detail_book/view/detail_book.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fourincare/person_select/controller/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonGridView extends StatelessWidget {
  final String servname;
  PersonGridView({super.key, required this.servname});

  @override
  Widget build(BuildContext context) {
    final perC = Get.put(PersonFetch());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFE8EDF2),
        title: Text(
          'Care Providers',
          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8EDF2), Color(0xFFF5F7FA)],
          ),
        ),
        child: GetBuilder<PersonFetch>(
          initState: (state) {
            perC.personDetailsFetch();
          },
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Banner
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF6A11CB).withOpacity(0.9),
                          Color(0xFF2575FC).withOpacity(0.9),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available Care Providers',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Choose your preferred care provider for $servname',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Grid View
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width < 330 ? 1 : 2,
                        childAspectRatio:
                            MediaQuery.of(context).size.width < 330
                                ? 0.7
                                : 0.75,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: perC.catergorypeople.length,
                      itemBuilder: (context, index) {
                        final person = perC.catergorypeople[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          shadowColor: Colors.black26,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Profile Image
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16)),
                                child: Image.network(
                                  person['pic'].toString(),
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name
                                    Text(
                                      person['name'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 8),

                                    // Age and Gender
                                    Row(
                                      children: [
                                        Icon(Icons.person_outline,
                                            size: 16, color: Colors.grey),
                                        SizedBox(width: 4),
                                        Text(
                                          '${person['age']} • ${person['gender']}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),

                                    // Rating
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          itemSize: 16,
                                          initialRating:
                                              person['rating'] ?? 0.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.zero,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print('Rating updated to $rating');
                                          },
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          '${person['rating']}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 16),

                                    // Select Button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF40864A),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          elevation: 2,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsAndBook(
                                              servName: servname,
                                              person: person,
                                            ),
                                          ));
                                        },
                                        child: Text(
                                          'Select Provider',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
