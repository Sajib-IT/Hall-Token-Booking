import 'package:tokenbooking/hall_select.dart';

import 'home_page.dart';
import 'home_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SplashScreen3 extends StatefulWidget {
  var selectedItem;
  SplashScreen3(this.selectedItem);

  @override
  State<SplashScreen3> createState() => _SplashScreenState3(selectedItem);
}

class _SplashScreenState3 extends State<SplashScreen3> {
  var selectedItem;
  _SplashScreenState3(this.selectedItem);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(selectedItem=='JAMH'){
      Future.delayed(Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Homepage() ))
      });
    }
    else if(selectedItem=='BSMRH'){
      Future.delayed(Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Homepage() ))
      });
    }
     else if(selectedItem=='SJRH'){
      Future.delayed(Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Homepage() ))
      });
    }
    else if(selectedItem=='AKBH'){
      Future.delayed(Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Homepage() ))
      });
    }
    else if(selectedItem=='SJJIH'){
      Future.delayed(Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Homepage() ))
      });
    }
    else if(selectedItem=='SRH'){
      Future.delayed(Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Homepage() ))
      });
    }
    else if(selectedItem=='BSFMH'){
      Future.delayed(Duration(seconds: 3)).then((value) => {Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Homepage() ))
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
            SpinKitDoubleBounce(
              color: Colors.blue,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
