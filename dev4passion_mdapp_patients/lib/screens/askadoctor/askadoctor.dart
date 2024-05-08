import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'dart:io';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
//import 'package:dev4passion_mdapp_patient/screens/authenticate/home.dart';
import 'package:dev4passion_mdapp_patients/service/http_Service.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

FirebaseDatabase database = FirebaseDatabase.instance;










class Askadoctor extends StatefulWidget {
  const Askadoctor({ Key? key }) : super(key: key);

  @override
  _AskadoctorState createState() => _AskadoctorState();
}

class _AskadoctorState extends State<Askadoctor> {


   CollectionReference askadoctor = FirebaseFirestore.instance.collection('askadoctor');
   DatabaseReference specialisations =
        FirebaseDatabase.instance.ref('specialisations/key_words');


    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    final TextEditingController _ageController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _countryController = TextEditingController();
    final TextEditingController _languageController = TextEditingController();
    final TextEditingController _medical_historyController = TextEditingController();
    final TextEditingController _detailsController = TextEditingController();
   
   
    late bool _success;
    late String? _userEmail;

     void getCurrentUser() async {
     User? user = await auth.currentUser;
    //  final uid = user?.uid;
     final uid = user?.email;
     print(uid);
    //  if (user!= null && user.isAnonymous == true) {
    //     setState((){
    //         status = "Signed In Anonymously";
    //     });
    //         } else {
    //             status = "Sign In failed";
    //         }
     }


      Future<String?> getcurrentUser() async {
    // Future<String?> getCurrentUser() async {
    
    ////Future<String?> getCurrentUser() async {
        
        String? currentuser = "";

        User? currentUser = await FirebaseAuth.instance.currentUser;
        // print("current");
        // print(currentUser?.uid);
        print("current");
        print(currentUser?.email);
       // _emailController = currentUser?.email;
       // return currentUser?.email;

            //  currentuser = currentUser?.email.toString();
            currentuser = currentUser?.email;

           return currentuser;
    } 

    Future<String?> getKeyWords() async {

        final ref = FirebaseDatabase.instance.ref();
        final snapshot = await ref.child('specialisations/keywords').get();
        if (snapshot.exists) {
            print("snapshot");
            print(snapshot.value);
        } else {
            print('No data available.');
        }

       // return snapshot;

    //     starCountRef.onValue.listen((DatabaseEvent event) {
    //    final data = event.snapshot.value;
    //          return data;
    //   // updateStarCount(data);
    //  });
    }




    void _askAQuestion() async {

        print(_ageController.text.toString());
        print(_nameController.text.toString());
        print(_countryController.text.toString());
        print(_languageController.text.toString());
        print(_medical_historyController.text.toString());
        print(_detailsController.text.toString());

        print(_userEmail);

        await askadoctor.add({
            'age': _ageController.text.toString(),
            'name': _nameController.text.toString(),
            'country': _countryController.text.toString(),
            'language': _languageController.text.toString(),
            'medical_history': _medical_historyController.text.toString(),
            'details': _detailsController.text.toString(),

            'user_email':_userEmail,

        });


    }


  @override
  Widget build(BuildContext context) {

     return new Scaffold(
        // body: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,

        // )

        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(15,110,0,0),
                        child: Text("SignUp",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold
                        )),
                ),



                Container(
                        padding: EdgeInsets.only(top:35, left:20, right: 30),
                        child: Column(
                            children: <Widget>[
                                TextField(
                                    controller: _ageController,
                                    decoration: InputDecoration(
                                        labelText: 'age',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green),
                                        )
                                    ),
                                ),

                                SizedBox(height:20,),

                                TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                        labelText: 'name',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green),
                                        )
                                    ),
                                    // obscureText: true,
                                ),
                                TextField(
                                    controller: _countryController,
                                    decoration: InputDecoration(
                                        labelText: 'country',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green),
                                        )
                                    ),
                                   // obscureText: true,
                                ),
                                TextField(
                                    controller: _languageController,
                                    decoration: InputDecoration(
                                        labelText: 'language',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green),
                                        )
                                    ),
                                   // obscureText: true,
                                ),
                                TextField(
                                    controller: _medical_historyController,
                                    decoration: InputDecoration(
                                        labelText: 'medical history',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green),
                                        )
                                    ),
                                   // obscureText: true,
                                ),
                                TextField(
                                    controller: _detailsController,
                                    decoration: InputDecoration(
                                        labelText: 'details',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green),
                                        )
                                    ),
                                   // obscureText: true,
                                ),


                                 SizedBox(height:5.0,),

                                //  Container(
                                //     alignment: Alignment(1,0),
                                //     padding: EdgeInsets.only(top:15, left:20),
                                //     child: InkWell(
                                //         child: Text(
                                //             'Forgot Password',
                                //             style: TextStyle(
                                //                 color: Colors.black,
                                //                 fontWeight: FontWeight.bold,
                                //                 fontFamily: 'Montserrat',
                                //                 decoration: TextDecoration.underline,
                                //             ),
                                //         ),

                                //     ),
                                //  ),

                                 SizedBox(height: 40,),
                                 Container(
                                    height: 40,
                                    child: Material(
                                        borderRadius: BorderRadius.circular(20),
                                        shadowColor: Colors.greenAccent,
                                        color: Colors.black,
                                        elevation: 7,
                                        child: GestureDetector(
                                            onTap: () async {

                                                // await HttpService.question(42,"lajsd","lakjsd","lajsd","lajsdf","ljsdf", context);
                                                await HttpService.question("42","lajsd","lakjsd","lajsd","lajsdf","ljsdf");


                                               // _register();

                                             //   _askAQuestion(); //turn off
                                               
                                               
                                               // getCurrentUser();

                                               getcurrentUser().then( (value) {
                                                print("getcurrentUser --");
                                                print(value);

                                                _userEmail = value;

                                                //_emailController = value.text;

                                                //  String? value_split = value?.split("@").first;
                                                 String value_split = value!.split("@").first;

                                                 print(value_split);
                                               
                                            //      var val_sp = value_split;
                                            //      final valsp = val_sp;

                                            //     final databaseReference = FirebaseDatabase.instance.ref("specialisations");
                                            //      //key
                                            //         databaseReference.child(valsp).set({
                                            //     'specialisation': _specialisationController.text.toString(),
                                            //     'key_words': _key_wordsController.text.toString(),
                                               
                                            //   });


                                              });

                                              getKeyWords().then( (value) {

                                                print("keywords");

                                                print(value);


                                              });

                                          









                                            },
                                            child: Center(
                                                child: Text(
                                                    'Send a question',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat',
                                                    ),
                                                ),
                                            ),

                                        ),
                                    ),
                                 ),

                                 SizedBox(height: 15,),
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                        InkWell(
                                            onTap: () {
                                                // Navigator.of(context).pushNamed('/signup');
                                                 Navigator.of(context).pop();
                                            },
                                                child: Text(
                                                    'back to Login',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontFamily: 'Montserrat',
                                                        fontWeight: FontWeight.bold,
                                                        decoration: TextDecoration.underline,
                                                    )
                                                )
                                            
                                        ),
                                    ]
                                 ),




                            ],
                        ),
                    ),
            ]

        )



        

       

    ); 
  
  
    // return Container(
      
    // );
  }
}