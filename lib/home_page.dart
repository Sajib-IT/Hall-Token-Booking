
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tokenbooking/contact.dart';
import 'package:tokenbooking/payment.dart';
import 'package:tokenbooking/profile.dart';
import 'package:tokenbooking/record.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLunchToken = false;
  bool isDinnerToken = false;
  int tokenPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: const Text("Homepage"),
        backgroundColor: Colors.blueAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        )),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade200,
        child: ListView(
          children: [
            const Image(
              image: AssetImage("lib/Assets/bg.png"),
            ),
            const ListTile(
              title: Text("HOME"),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: const Text("Profile"),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.arrow_forward_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const profile()),
                );
              },
            ),
            ListTile(
              title: const Text("Token"),
              leading: const Icon(Icons.generating_tokens),
              trailing: const Icon(Icons.arrow_forward_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Record()),
                );
              },
            ),
            ListTile(
              title: const Text("Contact"),
              leading: const Icon(Icons.contact_support),
              trailing: const Icon(Icons.arrow_forward_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Contact()),
                );
              },
            ),
            const ListTile(
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
              const SizedBox(
                height: 23,
              ),
              CarouselSlider(
                items: [
                  carouselItem(imgPath: "https://esrm.mbstu.ac.bd/uploads/slider/39370904945_7c780b3642_k5.jpg"),
                  carouselItem(imgPath: "https://cdn.risingbd.com/media/imgAll/2021March/en/Campus-2107011526.jpg"),
                  carouselItem(imgPath: "https://esrm.mbstu.ac.bd/uploads/slider/banner47.jpg"),
                  carouselItem(imgPath: "https://esrm.mbstu.ac.bd/uploads/slider/banner47.jpg")
                ],

                options: CarouselOptions(
                  height: 250.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Which one do you need? You can choose more than one if you want.",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '(Please Book your token From 7.00 PM To 11.59 PM)',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              buildCheckboxListTile(),
              buildCheckboxListTile(isLunch: false),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Your Total Price : ${tokenPrice}Tk",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (isLunchToken || isDinnerToken) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) =>
                            Payment(isLunchToken, isDinnerToken, tokenPrice)));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please select one or all",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER_LEFT,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 35),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black),
                child: const Text("Place Order"),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  CheckboxListTile buildCheckboxListTile({bool isLunch=true}) {
    return CheckboxListTile(
              secondary: isLunch ? const Icon(Icons.set_meal_outlined) :const Icon(Icons.dinner_dining_outlined) ,
              title:  isLunch ? const Text('Lunch') : const Text('Dinner'),
              subtitle:isLunch ? const Text('1:00 PM - 2:00 PM') : const Text('8:00 PM - 9:00 PM'),
              value:isLunch ? isLunchToken:isDinnerToken,
              onChanged: (bool? value) {
                setState(() {
                  if(isLunch){
                    isLunchToken = value!;
                    if (value) {
                      tokenPrice = tokenPrice + 30;
                    } else {
                      tokenPrice = tokenPrice - 30;
                    }
                  }else{
                    isDinnerToken = value!;
                    if (value) {
                      tokenPrice = tokenPrice + 30;
                    } else {
                      tokenPrice = tokenPrice - 30;
                    }
                  }

                });
              },
            );
  }

  Widget carouselItem({String? imgPath, bool isNet = true}) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: isNet
            ? DecorationImage(
          image: NetworkImage(imgPath!),
          fit: BoxFit.cover,
        )
            : DecorationImage(
          image: AssetImage(imgPath!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
