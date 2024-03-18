import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'splash_screen4.dart';

class Payment extends StatefulWidget {
  bool valuefirst;
  bool valuesecond;
  var price;
    Payment(this.valuefirst,this.valuesecond,this.price);

  @override
  State<Payment> createState() => _PaymentState(valuefirst,valuesecond,price);
}

class _PaymentState extends State<Payment> {
  bool valuefirst,valuesecond;
  var price;
  _PaymentState(this.valuefirst,this.valuesecond,this.price);
  String selectedItem = 'BKash';
  List options = ['BKash','Nagad','Rocket','Upay',];
   final accountController = TextEditingController();
   final transactionController = TextEditingController();
   //final amountController = TextEditingController();
   final IdController = TextEditingController();
   FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(title: Text("Payment"),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),

            )
        ),
        centerTitle: true,),
      
      body: SingleChildScrollView(
        child: Column(

          children: [
            Image(image: AssetImage('lib/Assets/cash-payment.png',),width: 180,height: 180,),
            Text("Select Payment Method",
              style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold
              ),),
            DropdownButton(
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
            SizedBox(height: 13,),
            Text("Billing Information",
                style: TextStyle(
                    fontSize: 20,
                )),
            SizedBox(height: 10,),
            TextFormField(
              controller: IdController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Your Student ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: accountController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Your Account Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
            SizedBox(height: 13,),
            TextFormField(
              controller: transactionController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Enter Transaction ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),

            ),
            SizedBox(height: 26,),
            /*TextFormField(
              controller: amountController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Enter Paid Amount',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),*/
            Text("Your Total Price : "+ price.toString()+"Tk",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.redAccent),),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed:(){


                if(valuefirst && valuesecond){
                  price=price-30;
                }

                if(valuefirst && valuesecond){
                  firestore.collection('lunch').doc(auth.currentUser!.uid).set(
                      {
                        'name' : auth.currentUser!.displayName,
                        'uid' :  auth.currentUser!.uid,
                        'number' :accountController.text,
                        'transaction' : transactionController.text,
                        'amount'  : price.toString(),
                        'time'   : DateTime.timestamp().toLocal().toString(),
                        'type' :  "Lunch".toString(),
                        'id' : IdController.text,
                        'method': selectedItem
                      }
                  );
                  firestore.collection('dinner').doc(auth.currentUser!.uid).set(
                      {
                        'name' : auth.currentUser!.displayName,
                        'uid' :  auth.currentUser!.uid,
                        'number' :accountController.text,
                        'transaction' : transactionController.text,
                        'amount'  : price.toString(),
                        'time'   : DateTime.timestamp().toLocal().toString(),
                        'type' :  "Dinner".toString(),
                        'id' : IdController.text,
                        'method': selectedItem
                      }
                  );


                }
               else if(valuesecond){

                  firestore.collection('dinner').doc(auth.currentUser!.uid).set(
                      {
                        'name' : auth.currentUser!.displayName,
                        'uid' :  auth.currentUser!.uid,
                        'number' :accountController.text,
                        'transaction' : transactionController.text,
                        'amount'  : price.toString(),
                        'time'   : DateTime.timestamp().toLocal().toString(),
                        'type' : "Dinner".toString(),
                        'id' : IdController.text,
                        'method': selectedItem
                      }
                  );

                }
               else if(valuefirst){
                  firestore.collection('lunch').doc(auth.currentUser!.uid).set(
                      {
                        'name' : auth.currentUser!.displayName,
                        'uid' :  auth.currentUser!.uid,
                        'number' :accountController.text,
                        'transaction' : transactionController.text,
                        'amount'  : price.toString(),
                        'time'   : DateTime.timestamp().toLocal().toString(),
                        'type' : "Lunch".toString(),
                        'id' : IdController.text,
                        'method': selectedItem

                      }

                  );

                }


                if(IdController.text=="" || accountController.text==""|| transactionController.text=="" ){
                  Fluttertoast.showToast(
                      msg: "Please fill up All Field",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER_LEFT,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
                else {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => SplashScreen4()));
                }

              },

              child: Text("Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
