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
//       'rating': .0,
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

// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:fourincare/detail_book/view/detail_book.dart';
// import 'package:fourincare/person_select/controller/controller.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cached_network_image/cached_network_image.dart';

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
//       'rating': .0,
//     },
//     // Add more people as needed
//   ];
//   PersonGridView({
//     Key? key,
//     required this.servname,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final perC = Get.put(PersonFetch());

//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Care Providers',
//           style: GoogleFonts.poppins(
//             color: Colors.black87,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: GetBuilder<PersonFetch>(
//         initState: (state) => perC.personDetailsFetch(),
//         builder: (controller) {
//           return GridView.builder(
//             padding: EdgeInsets.all(16),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
//               childAspectRatio: 0.75,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: controller.catergorypeople.length,
//             itemBuilder: (context, index) {
//               final person = controller.catergorypeople[index];
//               return _ProviderCard(person: person, servname: servname);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class _ProviderCard extends StatelessWidget {
//   final Map<String, dynamic> person;
//   final String servname;

//   const _ProviderCard({
//     required this.person,
//     required this.servname,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Image
//             ClipRRect(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//               child: CachedNetworkImage(
//                 imageUrl: person['pic'] ?? '',
//                 height: 140,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//                 placeholder: (context, url) => Container(
//                   color: Colors.grey[200],
//                   child: Center(child: CircularProgressIndicator()),
//                 ),
//                 errorWidget: (context, url, error) => Container(
//                   color: Colors.grey[200],
//                   child: Icon(Icons.person, size: 50, color: Colors.grey),
//                 ),
//               ),
//             ),

//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Name
//                     Text(
//                       person['name'] ?? 'Unknown',
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black87,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 4),

//                     // Age & Gender
//                     Text(
//                       '${person['age']} • ${person['gender']}',
//                       style: GoogleFonts.poppins(
//                         fontSize: 7,
//                         color: Colors.grey[600],
//                       ),
//                     ),

//                     // Rating
//                     Row(
//                       children: [
//                         RatingBarIndicator(
//                           rating: person['rating']?.toDouble() ?? 0,
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star_rounded,
//                             color: Colors.amber,
//                           ),
//                           itemCount: 5,
//                           itemSize: 16,
//                           unratedColor: Colors.grey[300],
//                         ),
//                         SizedBox(width: 4),
//                         Text(
//                           '${person['rating']?.toStringAsFixed(1)}',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.grey[600],
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Select Button
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                       backgroundColor: WidgetStatePropertyAll(Colors.green)),
//                   onPressed: () {
//                     // Handle select button press
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => DetailsAndBook(
//                         servName: '${servname}',
//                         person: person,
//                       ),
//                     ));
//                     print('${person['name']} selected');
//                   },
//                   child: Text(
//                     'Select',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fourincare/detail_book/view/detail_book.dart';
import 'package:fourincare/person_select/controller/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PersonGridView extends StatelessWidget {
  final String servname;
  final List<Map<String, dynamic>> people = [
    {
      'image':
          'https://via.placeholder.com/150', // Replace with actual image URLs
      'name': 'John Doe',
      'age': 30,
      'gender': 'Male',
      'rate': '\$50/hr',
      'rating': 4.5,
    },
    {
      'image':
          'https://via.placeholder.com/150', // Replace with actual image URLs
      'name': 'Jane Smith',
      'age': 25,
      'gender': 'Female',
      'rate': '\$45/hr',
      'rating': .0,
    },
    // Add more people as needed
  ];
  PersonGridView({
    Key? key,
    required this.servname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final perC = Get.put(PersonFetch());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Care Providers',
          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GetBuilder<PersonFetch>(
        initState: (state) => perC.personDetailsFetch(),
        builder: (controller) {
          return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: controller.catergorypeople.length,
            itemBuilder: (context, index) {
              final person = controller.catergorypeople[index];
              return _ProviderCard(person: person, servname: servname);
            },
          );
        },
      ),
    );
  }
}

class _ProviderCard extends StatelessWidget {
  final Map<String, dynamic> person;
  final String servname;

  const _ProviderCard({
    required this.person,
    required this.servname,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 6.0,
        shadowColor: Colors.black26,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person['name'] ?? 'Unknown',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${person['age']} • ${person['gender']}',
                        style: GoogleFonts.poppins(
                          fontSize: 7,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  SizedBox(width: 4),
                  RatingBarIndicator(
                    rating: person['rating']?.toDouble() ?? 0,
                    itemBuilder: (context, _) => Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16,
                    unratedColor: Colors.grey[300],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsAndBook(
                          servName: '${servname}',
                          person: person,
                        ),
                      ));
                    },
                    child: Text(
                      'Select',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
