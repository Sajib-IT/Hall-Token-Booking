import 'home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen3 extends StatefulWidget {
  var selectedItem;
  SplashScreen3(this.selectedItem);

  @override
  State<SplashScreen3> createState() => _SplashScreenState3();
}

class _SplashScreenState3 extends State<SplashScreen3> {
  _SplashScreenState3();
  @override
  void initState() {
    switch (widget.selectedItem) {
      case 'JAMH':
        navigatePage();
        break;
      case 'BSMRH':
        navigatePage();
        break;
      case 'SJRH':
        navigatePage();
        break;
      case 'AKBH':
        navigatePage();
        break;
      case 'SJJIH':
        navigatePage();
        break;
      case 'SRH':
        navigatePage();
        break;
      case 'BSFMH':
        navigatePage();
        break;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/Assets/BW.jpg'),
              width: 350,
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              '  Loading..',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitDoubleBounce(
              color: Colors.blue,
              size: 50,
            )
          ],
        ),
      ),
    );
  }

  void navigatePage() {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const Homepage()))
        });
  }
}
