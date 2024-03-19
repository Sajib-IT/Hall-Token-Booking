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
  List options = [
    'JAMH',
    'BSMRH',
    'SJRH',
    'AKBH',
    'SJJIH',
    'SRH',
    'BSFMH',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        title: const Text("Hall Select"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                carouselItem(imgPath: 'lib/Assets/SRH.jpg'),
                carouselItem(imgPath: 'lib/Assets/bsmrh.jpg'),
                carouselItem(imgPath: 'lib/Assets/JAMH.jpg'),
                carouselItem(
                    imgPath: 'https://naeemur.github.io/mbstu/assets/a/32.jpg',isNet: true),
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
              height: 30,
            ),
            const Text(
              "Select Your Hall",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            DropdownButton(
                isExpanded: true,
                style: const TextStyle(color: Colors.black, fontSize: 22),
                value: selectedItem,
                items: options
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedItem = value.toString();
                  });
                }),
            const SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
              width: 100,
              height: 100,
              // color: Colors.cyan,

              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => SplashScreen3(selectedItem)));
                  },
                  icon: const Icon(
                    Icons.navigate_next,
                    size: 70,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget carouselItem({String? imgPath, bool isNet = false}) {
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
