import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tokenbooking/profile.dart';
import 'package:tokenbooking/contact.dart';
import 'package:tokenbooking/profile2.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  var uid;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:Text('Admin Panel'),
      ),

        drawer: Drawer(
          backgroundColor: Colors.cyan,
          child: ListView(
            children: [
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> profile2()),);

                },
              ),
              ListTile(
                title: Text("Favorite"),
                leading: Icon(Icons.favorite),
                trailing: Icon(Icons.arrow_forward_outlined),
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
                onTap: (){

                },

              ),


            ],
          ),

        ),

      body: Column(
        children: [
          Expanded(child: lunch()),
          Expanded(child: dinner()),
        ],
      )

    );
  }
  Future<void> deleteDocument1() async {
    try {
      // Reference to the document you want to delete
      DocumentReference documentReference = FirebaseFirestore.instance.collection('lunch').doc(uid);

      // Delete the document
      await documentReference.delete();

      print('Document deleted successfully.');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
  Future<void> deleteDocument2() async {
    try {
      // Reference to the document you want to delete
      DocumentReference documentReference = FirebaseFirestore.instance.collection('dinner').doc(uid);

      // Delete the document
      await documentReference.delete();

      print('Document deleted successfully.');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  Widget lunch(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('lunch').snapshots(),
      builder: (context, snapshot) {

        // Process the data and build your UI here
        final List<DocumentSnapshot> documents = snapshot.data!.docs;
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final itemData = documents[index].data() as Map<String, dynamic>;
            final name = itemData['name']; // Replace 'name' with the field you want to display.
            final  id= itemData['id']; // Replace 'name' with the field you want to display.
            final  trx = itemData['transaction']; // Replace 'name' with the field you want to display.
            final  number = itemData['number']; // Replace 'name' with the field you want to display.
            final  amount = itemData['amount']; // Replace 'name' with the field you want to display.
            final  type = itemData['type']; // Replace 'name' with the field you want to display.
            final  time = itemData['time']; // Replace 'name' with the field you want to display.
            final  method = itemData['method'];
            uid = itemData['uid'];// Replace 'name' with the field you want to display.

            return
              Column(
                children: [

                  SizedBox(height: 10,),
                  Container(


                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue.shade200),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Text("ID-"+id,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                                  Text("Name: "+name),
                                  Text("TID: "+trx),
                                  Text("Mobile Number: "+number),
                                  Text("Paid amount: "+amount),
                                  Text("Payment Method: "+method),
                                  Text(type),
                                  Text(time),

                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                deleteDocument1();
                              },
                              icon: Icon(Icons.delete_sharp,size: 60,),alignment: Alignment.centerLeft,)
                          ],

                        ),
                      ),
                    ),
                  ),
                  //SizedBox(height: 20,)
                ],
              );



            // Add more widgets to display other fields as needed.


          },
        );
      },
    );
  }
  Widget dinner(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('dinner').snapshots(),
      builder: (context, snapshot) {


        // Process the data and build your UI here
        final List<DocumentSnapshot> documents = snapshot.data!.docs;
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final itemData = documents[index].data() as Map<String, dynamic>;
            final name = itemData['name']; // Replace 'name' with the field you want to display.
            final  id= itemData['id']; // Replace 'name' with the field you want to display.
            final  trx = itemData['transaction']; // Replace 'name' with the field you want to display.
            final  number = itemData['number']; // Replace 'name' with the field you want to display.
            final  amount = itemData['amount']; // Replace 'name' with the field you want to display.
            final  type = itemData['type']; // Replace 'name' with the field you want to display.
            final  time = itemData['time']; // Replace 'name' with the field you want to display.
            final  method = itemData['method'];
            uid = itemData['uid'];// Replace 'name' with the field you want to display.

            return
              Column(
                children: [

                 // SizedBox(height: 10,),
                  Container(


                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue.shade200),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Text("ID-"+id,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                                  Text("Name: "+name),
                                  Text("TID: "+trx),
                                  Text("Mobile Number: "+number),
                                  Text("Paid amount: "+amount),
                                  Text("Payment Method: "+method),
                                  Text(type),
                                  Text(time),

                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                deleteDocument2();
                              },
                              icon: Icon(Icons.delete_sharp,size: 60,),alignment: Alignment.centerLeft,)
                          ],

                        ),
                      ),
                    ),
                  ),
                 // SizedBox(height: 20,)
                ],
              );



            // Add more widgets to display other fields as needed.


          },
        );
      },
    );
  }
}
