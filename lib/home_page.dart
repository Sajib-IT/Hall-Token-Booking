
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tokenbooking/contact.dart';
import 'package:tokenbooking/payment.dart';
import 'package:tokenbooking/profile.dart';
import 'package:tokenbooking/record.dart';
class Homepage extends StatefulWidget {
  const Homepage ({super.key});
  @override
  State<Homepage> createState() => _HomepageState();

}

class _HomepageState extends State<Homepage> {
  bool valuefirst = false;
  bool valuesecond = false;
  var price=0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(title: Text("Homepage"),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),

            )
        ),
      centerTitle: true,),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade200,

        child: ListView(
          children: [
            Image(image: AssetImage("lib/Assets/bg.png"),),

            ListTile(
              title: Text("HOME"),
              leading: Icon(Icons.home),
              //trailing: Icon(Icons.arrow_forward_outlined),
              //onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()),);
              //},
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_forward_outlined),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> profile()),);

              },
            ),
            ListTile(
              title: Text("Token"),
              leading: Icon(Icons.generating_tokens),
              trailing: Icon(Icons.arrow_forward_outlined),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Record()),);

              },
            ),
            ListTile(
              title: Text("Contract"),
              leading: Icon(Icons.contact_support),
              trailing: Icon(Icons.arrow_forward_outlined),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Contact()),);

              },

            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.exit_to_app),
              trailing: Icon(Icons.arrow_forward_outlined),

                



            ),


          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 23,),
              CarouselSlider(

                items: [
                  //1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage("https://esrm.mbstu.ac.bd/uploads/slider/39370904945_7c780b3642_k5.jpg"),
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
                        image: NetworkImage("https://cdn.risingbd.com/media/imgAll/2021March/en/Campus-2107011526.jpg"),
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
                        image: NetworkImage("https://esrm.mbstu.ac.bd/uploads/slider/banner47.jpg"),
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
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.all(8.0),

                child: Text("Which one do you need? You can choose more than one if you want.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                ),

              ),
              SizedBox(height: 20,),
              Text('(Please Book your token From 7.00 PM To 11.59 PM)',style: TextStyle(fontSize: 15),),
              SizedBox(height: 20,),

              CheckboxListTile(
                secondary: const Icon(Icons.set_meal_outlined),
                title: const Text('Lunch'),
                subtitle: Text('1:00 PM - 2:00 PM'),
                value: this.valuefirst,
                onChanged: (bool? value) {
                  setState(() {
                    this.valuefirst = value!;
                    if(value){
                      price=price+30;
                    }
                    else{
                      price=price-30;
                    }
                  });
                },
              ),

              CheckboxListTile(
                secondary: const Icon(Icons.dinner_dining_outlined),
                title: const Text('Dinner'),
                subtitle: Text('8:00 PM - 9:00 PM'),
                value: this.valuesecond,
                onChanged: (bool? value) {
                  setState(() {
                    this.valuesecond= value!;
                    if(value){
                      price=price+30;
                    }
                    else{
                      price=price-30;
                    }
                  });
                },
              ),
              SizedBox(height: 30,),
              Text("Your Total Price : "+ price.toString()+"Tk",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.redAccent),),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: (){
                    if(valuefirst || valuesecond){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => Payment(valuefirst, valuesecond,price)));
                    }
                    else {
                      Fluttertoast.showToast(
                          msg: "Please select one or all",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER_LEFT,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  },

                  child: Text("Place Order"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,foregroundColor: Colors.black),


              )

            ],
          ),
        ),
      ),
      );

  }

}
