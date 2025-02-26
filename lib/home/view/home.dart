import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fourincare/aboutus/view/aboutus.dart';
import 'package:fourincare/account/view/account.dart';
import 'package:fourincare/appointment/view/appointment.dart';
import 'package:fourincare/auth/view/login.dart';
import 'package:fourincare/coustmercare/view/cousmercare.dart';
import 'package:fourincare/person_select/person-select.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../model/text_model.dart';

// Text Model Class

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextModel textModel = TextModel();
  int checkindex = 0;

  // Animation controllers
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _chipController;
  late Animation<double> _chipAnimation;
  late AnimationController _fabController;
  late Animation<double> _fabAnimation;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  bool _isVisible = false;
  int? selectedIndex;
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> catString = ['Assistance', 'Care', 'Househelp'];

  List<String> servnameCheck(int index) {
    if (index == 0) {
      return [
        ...textModel.assiservices.map((service) => service.name),
        ...textModel.careservices.map((service) => service.name),
        ...textModel.houseservices.map((service) => service.name),
      ];
    } else if (index == 1) {
      return textModel.assiservices.map((service) => service.name).toList();
    } else if (index == 2) {
      return textModel.careservices.map((service) => service.name).toList();
    } else {
      return textModel.houseservices.map((service) => service.name).toList();
    }
  }

  List<String> servDscCheck(int index) {
    if (index == 0) {
      return [
        ...textModel.assiservices.map((service) => service.description),
        ...textModel.careservices.map((service) => service.description),
        ...textModel.houseservices.map((service) => service.description),
      ];
    } else if (index == 1) {
      return textModel.assiservices
          .map((service) => service.description)
          .toList();
    } else if (index == 2) {
      return textModel.careservices
          .map((service) => service.description)
          .toList();
    } else {
      return textModel.houseservices
          .map((service) => service.description)
          .toList();
    }
  }

  List<String> servImgCheck(int index) {
    if (index == 0) {
      return [
        ...textModel.assiservices.map((service) => service.imageUrl),
        ...textModel.careservices.map((service) => service.imageUrl),
        ...textModel.houseservices.map((service) => service.imageUrl),
      ];
    } else if (index == 1) {
      return textModel.assiservices.map((service) => service.imageUrl).toList();
    } else if (index == 2) {
      return textModel.careservices.map((service) => service.imageUrl).toList();
    } else {
      return textModel.houseservices
          .map((service) => service.imageUrl)
          .toList();
    }
  }

  String getCategoryType(int globalIndex) {
    int assiLength = textModel.assiservices.length;
    int careLength = textModel.careservices.length;

    if (globalIndex < assiLength) {
      return "Assistance";
    } else if (globalIndex < assiLength + careLength) {
      return "Care";
    } else {
      return "Househelp";
    }
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case "Assistance":
        return Color(0xFF6A11CB);
      case "Care":
        return Color(0xFF2575FC);
      case "Househelp":
        return Color(0xFFFF8008);
      default:
        return Color(0xFF6A11CB);
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: -200, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart),
    );

    _chipController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _chipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _chipController, curve: Curves.easeOut),
    );

    _fabController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _fabAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fabController, curve: Curves.elasticOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      _fabController.forward();
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chipController.dispose();
    _fabController.dispose();
    super.dispose();
  }

  Widget _animatedDrawerItem(
    IconData icon,
    String title,
    Widget? page, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: isLogout ? Colors.redAccent : Color(0xFF6A11CB),
        size: 22,
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isLogout ? Colors.redAccent : Color(0xFF2C3E50),
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        if (page != null) {
          Get.to(
            page,
            transition: Transition.rightToLeftWithFade,
            duration: Duration(milliseconds: 300),
          );
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      hoverColor: Color(0xFFE8EDF2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = LinearGradient(
        colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight);
    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white, size: 28),
          title: Text(
            'WeCare',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
                letterSpacing: 1.2,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.bell_fill),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFF3F5F7)],
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        'https://lottie.host/90fdcb2a-f335-4d9f-8558-ffeb7a580c7c/rXsPOGcdno.json',
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Welcome!',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _animatedDrawerItem(
                  FontAwesomeIcons.userCircle,
                  'Account',
                  AccountDetailsPage(),
                ),
                _animatedDrawerItem(
                  FontAwesomeIcons.calendarAlt,
                  'Appointments',
                  AppointmentListPage(),
                ),
                _animatedDrawerItem(
                  FontAwesomeIcons.infoCircle,
                  'About Us',
                  AboutUsPage(),
                ),
                _animatedDrawerItem(
                  FontAwesomeIcons.headset,
                  'Customer Care',
                  CustomerCarePage(),
                ),
                Divider(thickness: 1.5),
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            title: const Text(
                              'Logout',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            content: const Text(
                              'Are you sure you want to logout?',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.grey[600],
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await _auth.signOut();
                                  if (mounted) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                      (route) => false,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  foregroundColor: Colors.black87,
                                  elevation: 2,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: const Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            contentPadding: const EdgeInsets.fromLTRB(
                                24.0, 20.0, 24.0, 8.0),
                            actionsPadding: const EdgeInsets.fromLTRB(
                                16.0, 0.0, 16.0, 16.0),
                            elevation: 5.0,
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black87,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                    icon: const Icon(Icons.logout, size: 20),
                    label: const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
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
          child: Column(
            children: [
              SizedBox(
                  height:
                      kToolbarHeight + MediaQuery.of(context).padding.top + 8),
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF6A11CB).withOpacity(0.9),
                        Color(0xFF2575FC).withOpacity(0.9)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back!',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              'Find assistance that suits your needs',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Animated category chips
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_animation.value, 0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: catString.length + 1,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  checkindex = index;
                                });
                                _chipController.forward(from: 0);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: AnimatedBuilder(
                                  animation: _chipController,
                                  builder: (context, _) {
                                    return Transform.scale(
                                      scale: checkindex == index
                                          ? 1.0 + _chipAnimation.value * 0.1
                                          : 1.0,
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: checkindex == index
                                                ? [
                                                    Color(0xFFFF8008),
                                                    Color(0xFFFFC837)
                                                  ]
                                                : [
                                                    Color(0xFF6A11CB),
                                                    Color(0xFF2575FC)
                                                  ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: (checkindex == index
                                                      ? Color(0xFFFF8008)
                                                      : Color(0xFF6A11CB))
                                                  .withOpacity(0.3),
                                              blurRadius: 8,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          index == 0
                                              ? 'All'
                                              : catString[index - 1],
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Service cards list with improved spacing
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                  itemCount: servnameCheck(checkindex).length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;

                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = isSelected ? null : index;
                          });
                        },
                        child: Card(
                          elevation: isSelected ? 8.0 : 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: isSelected
                                  ? Colors.blue.shade700
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          shadowColor: isSelected
                              ? Colors.blue.shade300.withOpacity(0.6)
                              : Colors.grey.shade400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16)),
                                child: Image.network(
                                  servImgCheck(checkindex)[
                                      index], // Fetching image dynamically
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      servnameCheck(checkindex)[index],
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      servDscCheck(checkindex)[index],
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      'Price: ₹200',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: isSelected
                                            ? Colors.green.shade800
                                            : Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Center(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 14),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                            elevation: isSelected ? 4.0 : 2.0,
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                          ),
                                          onPressed: _isLoading
                                              ? null
                                              : () {
                                                  Get.to(PersonGridView(
                                                    servname: servnameCheck(
                                                        checkindex)[index],
                                                  ));
                                                },
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: isSelected
                                                    ? [
                                                        Color(0xFF6A11CB),
                                                        Color(0xFF2575FC)
                                                      ]
                                                    : [
                                                        Color(0xFFFF8008),
                                                        Color(0xFFFFC837)
                                                      ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  BoxConstraints(minHeight: 48),
                                              child: Text(
                                                'Choose CareProvider',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
