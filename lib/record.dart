import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Record"),),
      body:  Column(
        children: [
          Text('Your Token'.toUpperCase(),
            style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w300
            ),),
          Text('Thank you for purchase! \n Show Your Token Bellow',
            style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic
            ),),
          SizedBox(height: 30,),
          // Image(image: AssetImage('lib/Assets/receipt.png'),height: 150,width: 300,),
          SizedBox(height: 40,),
          Expanded(child: lunch()),
          Expanded(child: dinner()),
        ],
      )

    );
  }

  Widget lunch(){
    return StreamBuilder(

      stream: FirebaseFirestore.instance.collection('lunch').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
      builder: (context,snapshot){
        bool visible= false;
        Map<String,dynamic> userData = {};
        try{
           userData = snapshot.data!.data() as Map<String, dynamic>;
           visible=true;
        }
        catch(error){
          visible=false;
        }
        return Visibility(
          visible: visible,
          child: Column(
            children: [


              Center(
                child: Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.cyan.shade200),

                  height: 250,
                  width: 425,

                  padding: EdgeInsets.all(20),



                  //color: Colors.grey.shade200,
                  child: ListView(
                    children: [
                      Text("Student ID :" + userData['id'].toString(),textAlign: TextAlign.left,style: TextStyle(fontSize: 25),),
                      Text("Name :" + userData['name'].toString(),textAlign: TextAlign.left,),

                      Text("Mobile :" + userData['number'].toString(),textAlign:TextAlign.left,),
                      Text("Amount :" + userData['amount'].toString(),textAlign:TextAlign.left,),
                      Text("Transaction ID :" + userData['transaction'].toString(),textAlign:TextAlign.left,),
                      Text("Type :" + userData['type'].toString(),textAlign:TextAlign.left,),
                      Text("Method :" + userData['method'].toString(),textAlign:TextAlign.left,),
                      Text("Time :" + userData['time'].toString(),textAlign:TextAlign.left,),

                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget dinner(){
    return StreamBuilder(

      stream: FirebaseFirestore.instance.collection('dinner').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
      builder: (context,snapshot){
        bool  visible=false;
        Map<String,dynamic> userData = {};
        try{
          userData = snapshot.data!.data() as Map<String, dynamic>;
          visible=true;
        }
        catch(error){
         visible = false;
        }
        return Visibility(
          visible: visible,
          child: Column(
            children: [
              Center(
                child: Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.yellow.shade300),

                  height: 250,
                  width: 425,

                  padding: EdgeInsets.all(20),



                  //color: Colors.grey.shade200,
                  child: ListView(
                    children: [
                      Text("Student ID :" + userData['id'].toString(),textAlign: TextAlign.left,style: TextStyle(fontSize: 25),),
                      Text("Name :" + userData['name'].toString(),textAlign: TextAlign.left,),

                      Text("Mobile :" + userData['number'].toString(),textAlign:TextAlign.left,),
                      Text("Amount :" + userData['amount'].toString(),textAlign:TextAlign.left,),
                      Text("Transaction ID :" + userData['transaction'].toString(),textAlign:TextAlign.left,),
                      Text("Type :" + userData['type'].toString(),textAlign:TextAlign.left,),
                      Text("Method :" + userData['method'].toString(),textAlign:TextAlign.left,),
                      Text("Time :" + userData['time'].toString(),textAlign:TextAlign.left,),

                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
