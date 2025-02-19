import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fourincare/auth/view/login.dart';
import 'package:fourincare/firebase_options.dart';
import 'package:fourincare/home/view/home.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? Intro() : Home(),
    );
  }
}

List<PageViewModel> pg = [
  PageViewModel(
    title: "Welcome to 4 InCare",
    body: "We are delighted to assist your dear one.",
    image: const Center(
      child: Icon(Icons.waving_hand, size: 50.0),
    ),
  ),
  PageViewModel(
    title: "We have!!",
    body:
        "We have dedicated and trained care taker.Your dear one safe with Us ",
    image: Lottie.network(
        'https://lottie.host/ae1c0004-bc73-472d-ad08-548f75dd0cd0/w5nFGPteI2.json'),
    // Image.network(
    //   "https://static.vecteezy.com/system/resources/previews/020/549/092/non_2x/teen-girl-carry-bags-helping-elderly-woman-with-grocery-shopping-kind-caring-granddaughter-hold-products-help-old-grandmother-with-heavy-packages-older-and-younger-generation-illustration-vector.jpg",
    //   // height: 175.0,
    //   width: double.infinity,
    // ),
    decoration: const PageDecoration(
      pageColor: Color.fromARGB(255, 255, 255, 255),
    ),
  ),
  PageViewModel(
    title: "Let's Go!!",
    body: "Start your first Service Free!",
    image: const Center(
      child: Text("", style: TextStyle(fontSize: 100.0)),
    ),
    decoration: const PageDecoration(
      titleTextStyle: TextStyle(color: Colors.orange),
      bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
    ),
  ),
  // PageViewModel(
  //   title: "Title of custom button page",
  //   body: "This is a description on a page with a custom button below.",
  //   image: Image.asset("res/images/logo.png", height: 175.0),
  //   footer: ElevatedButton(
  //     onPressed: () {
  //       // On button pressed
  //     },
  //     child: const Text("Let's Go!"),
  //   ),
  // ),
  // PageViewModel(
  //   title: "Title of custom body page",
  //   bodyWidget: Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: const [
  //       Text("Click on "),
  //       Icon(Icons.edit),
  //       Text(" to edit a post"),
  //     ],
  //   ),
  //   image: const Center(child: Icon(Icons.android)),
  // )
];

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // dotsContainerDecorator: BoxDecoration(color: Colors.amber),
      dotsDecorator: DotsDecorator(
          activeColor: Colors.amber,
          color: const Color.fromARGB(255, 142, 142, 142)),
      pages: pg,
      showBackButton: true,
      showNextButton: false,
      back: const Icon(Icons.arrow_back),
      done: const Text("Done"),
      onDone: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Login()
          // Home()
          ,
        ));
        // On button pressed
      },
    );
  }
}
