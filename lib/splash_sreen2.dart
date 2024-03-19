import 'package:tokenbooking/hall_select.dart';
import 'home_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen2 extends StatefulWidget {
String selectedItem;
SplashScreen2(this.selectedItem, {super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<SplashScreen2> {
_SplashScreenState2();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.selectedItem=='Student'){
      Future.delayed(const Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Hallpage() ))
      });
    }
    else if(widget.selectedItem=='Admin'){
      Future.delayed(const Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Homepage2() ))
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
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
            Text('  Loading..',style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            SpinKitWanderingCubes(
              color: Colors.blue,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
