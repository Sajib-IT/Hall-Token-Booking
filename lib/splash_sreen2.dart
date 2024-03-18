import 'package:tokenbooking/hall_select.dart';

import 'home_page.dart';
import 'home_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SplashScreen2 extends StatefulWidget {
var selectedItem;
SplashScreen2(this.selectedItem);

  @override
  State<SplashScreen2> createState() => _SplashScreenState2(selectedItem);
}

class _SplashScreenState2 extends State<SplashScreen2> {
var selectedItem;
_SplashScreenState2(this.selectedItem);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(selectedItem=='Student'){
      Future.delayed(Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Hallpage() ))
      });
    }
    else if(selectedItem=='Admin'){
      Future.delayed(Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Homepage2() ))
      });
    }

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
