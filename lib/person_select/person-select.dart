import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fourincare/detail_book/view/detail_book.dart';
import 'package:fourincare/person_select/controller/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PersonGridView extends StatelessWidget {
  final String servname;

  PersonGridView({Key? key, required this.servname}) : super(key: key);

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
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GetBuilder<PersonFetch>(
        initState: (state) => perC.personDetailsFetch(),
        builder: (controller) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            itemCount: controller.catergorypeople.length,
            itemBuilder: (context, index) {
              final person = controller.catergorypeople[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _ProviderCard(person: person, servname: servname),
              );
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

  const _ProviderCard({required this.person, required this.servname});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.blue.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.blue.shade50,
            ],
          ),
        ),
        child: Row(
          children: [
            // Profile Image Section
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: person['pic'] ?? 'https://via.placeholder.com/150',
                height: 200,
                width: 160,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[200],
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.person, size: 50, color: Colors.grey),
                ),
              ),
            ),

            // Details Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person['name'] ?? 'Unknown',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.person_outline,
                            size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '${person['age']} • ${person['gender']}',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.attach_money,
                            size: 16, color: Colors.green[600]),
                        Text(
                          person['rate'] ?? 'N/A',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    RatingBarIndicator(
                      rating: (person['rating'] as num?)?.toDouble() ?? 0.0,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 18,
                      unratedColor: Colors.grey[300],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[600],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          elevation: 2,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsAndBook(
                                servName: servname,
                                person: person,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Select Provider',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
