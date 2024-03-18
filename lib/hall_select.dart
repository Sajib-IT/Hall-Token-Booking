import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tokenbooking/splash_screen3.dart';

class Hallpage extends StatefulWidget {
  const Hallpage({super.key});

  @override
  State<Hallpage> createState() => _HallpageState();
}

class _HallpageState extends State<Hallpage> {

  String selectedItem = 'JAMH';
  List options = ['JAMH','BSMRH','SJRH','AKBH','SJJIH','SRH','BSFMH',];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),

          )
        ),

        title: Text("Hall Select"),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(

              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('lib/Assets/SRH.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("lib/Assets/bsmrh.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("lib/Assets/JAMH.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://naeemur.github.io/mbstu/assets/a/32.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(height: 30,),
            Text("Select Your Hall",
            style: TextStyle(
              fontSize: 24,fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 80,),
            DropdownButton(

              isExpanded: true,
              style: TextStyle(color: Colors.black,fontSize: 22),

                value: selectedItem,
                items: options
                    .map((day) => DropdownMenuItem(
                  child: Text(day),
                  value: day,),
                ).toList(),
                onChanged: (value){
                  setState(() {
                    selectedItem = value.toString();
                  });
                }),
            SizedBox(height: 100,),
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(20)
              ),
              width: 100,
              height: 100,
              // color: Colors.cyan,

              child: IconButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> SplashScreen3(selectedItem)));
                  },
                  icon: Icon(Icons.navigate_next,size: 70,color: Colors.white,)),
            )
          ],
        ),
      ),
    );
  }
}
