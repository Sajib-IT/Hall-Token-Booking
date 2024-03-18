import 'record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page.dart';

class SplashScreen4 extends StatefulWidget {
  const SplashScreen4({Key? key}) : super(key: key);

  @override
  State<SplashScreen4> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen4> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) => { Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Record() ))

    });
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('lib/Assets/BW.jpg'),
              width:350 ,
            ),
            SizedBox(height: 100,),
            SpinKitChasingDots(
              color: Colors.blue,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
