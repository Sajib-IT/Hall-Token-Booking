import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tokenbooking/splash_sreen2.dart';
import 'login_page.dart';

class Register extends StatefulWidget {

   Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String selectedItem = 'Student';
  List options = ['Admin', 'Student'];

  final nameController = TextEditingController();
  final idController = TextEditingController();
  final deptController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  User?user;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('lib/Assets/register.jpg'),
                height: 200,
              ),
              SizedBox(
                height: 35,
              ),

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

              TextFormField(
                controller: nameController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'Enter your Name',
                    prefixIcon: Icon(Icons.man),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
              SizedBox(height: 15,),

              TextFormField(
                controller: idController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'Enter your ID',
                    prefixIcon: Icon(Icons.man),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
              SizedBox(height: 15,),

              TextFormField(
                controller: deptController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'Enter your Dept. Name',
                    prefixIcon: Icon(Icons.man),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
              SizedBox(height: 15,),


       SizedBox(height: 20,),
              TextFormField(
                controller: emailController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter your Email Address',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                textAlign: TextAlign.center,
                obscureText: passToggle,
                decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(passToggle?Icons.visibility:Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
              SizedBox(
                height: 30,
              ),


              ElevatedButton(
                onPressed:() async {
                  try{
                    UserCredential  userCredential = await auth.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text );
                    user = userCredential.user;
                    await user!.updateDisplayName(nameController.text);
                    await user!.reload();
                    user= auth.currentUser;

                    if(selectedItem == 'Admin'){
                      firestore.collection('admins').doc(userCredential.user!.uid).set(
                          {

                            'email' :emailController.text,
                            'name'  : nameController.text,
                            'pass' : passwordController.text,
                            'uid' :  userCredential.user!.uid
                          }
                      );
                    }
                    if(selectedItem == 'Student'){
                      firestore.collection('students').doc(userCredential.user!.uid).set(
                          {

                            'uid' :  userCredential.user!.uid,
                            'email' :emailController.text,
                            'name'  : nameController.text,
                            'pass'  : passwordController.text,
                            'id'  : idController.text,
                            'dept' : deptController.text,
                          }
                      );
                    }

                    if(user!=null){
                      //Navigator.pushNamed(context,"splash2");
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> SplashScreen2(selectedItem)));
                      Fluttertoast.showToast(
                          msg: "Succesfull Registered",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 18.0
                      );
                    }
                  }

                  on FirebaseAuthException catch(e){
                    if(e.code=='week-password'){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Week password, try to strong',style: TextStyle(fontSize: 16),),backgroundColor: Colors.orange,));

                    }
                    if(e.code=='email-already in use'){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email already exist! Please try new.',style: TextStyle(fontSize: 16),),backgroundColor: Colors.orange,));
                    }
                  }

                  catch(e){
                    print(e);
                  }
                }, child: Text("Register") ,),



              SizedBox(height: 6.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have account? "),
                  InkWell(
                    child: Text("Login now  "
                      ,style: TextStyle(
                          color: Colors.blue
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, "login");
                    },
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
