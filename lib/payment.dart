import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'splash_screen4.dart';

@immutable
class Payment extends StatefulWidget {
  bool isLunchToken;
  bool isDinnerToken;
  int tokenPrice;
  Payment(this.isLunchToken, this.isDinnerToken, this.tokenPrice, {super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  _PaymentState();
  bool isFill =false;
  String selectedItem = 'BKash';
  List options = [
    'BKash',
    'Nagad',
    'Rocket',
    'Upay',
  ];
  final accountController = TextEditingController();
  final transactionController = TextEditingController();
  final idController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.blueAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage(
                'lib/Assets/cash-payment.png',
              ),
              width: 180,
              height: 180,
            ),
            const Text(
              "Select Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropdownButton(
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
              height: 13,
            ),
            const Text("Billing Information",
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(
              height: 10,
            ),
            myTextForm(controller: idController, hint: 'Your Student ID'),
            const SizedBox(
              height: 10,
            ),
            myTextForm(
                controller: accountController, hint: 'Your Account Number'),
            const SizedBox(
              height: 13,
            ),
            myTextForm(
                controller: transactionController,
                hint: 'Enter Transaction ID'),
            const SizedBox(
              height: 26,
            ),
            Text(
              "Your Total Price : ${widget.tokenPrice}Tk",
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
                // if (widget.isLunchToken && widget.isDinnerToken) {
                //   widget.tokenPrice = widget.tokenPrice - 30;
                // }
                if (idController.text.isNotEmpty &&
                    accountController.text.isNotEmpty &&
                    transactionController.text.isNotEmpty){
                  if (widget.isLunchToken && widget.isDinnerToken) {
                    List<String> typeList=["lunch","dinner"];
                    dataStore(typeList);
                  } else if (widget.isDinnerToken) {
                    List<String> typeList=["dinner"];
                    dataStore(typeList);
                  } else if (widget.isLunchToken) {
                    List<String> typeList=["lunch"];
                    dataStore(typeList);
                  }
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => const SplashScreen4()));
                }
                else{
                  Fluttertoast.showToast(
                      msg: "Please fill up All Fields",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER_LEFT,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: const Text("Payment"),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField myTextForm(
      {required TextEditingController controller, required String hint}) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
    );
  }

  void dataStore(List<String> list){
    for(String item in list){
      firestore.collection(item).doc(auth.currentUser!.uid).set({
        'name': auth.currentUser!.displayName,
        'uid': auth.currentUser!.uid,
        'number': accountController.text,
        'transaction': transactionController.text,
        'amount': "30 tk",
        'time': DateTime.timestamp().toLocal().toString(),
        'type': item,
        'id': idController.text,
        'method': selectedItem
      });
    }
  }
}
