//library dart.core;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


class Specialisation extends StatefulWidget {
  const Specialisation({ Key? key }) : super(key: key);

  @override
  _SpecialisationState createState() => _SpecialisationState();
}


// final databaseReference = FirebaseDatabase.instance.ref("specialisations");

class _SpecialisationState extends State<Specialisation> {

    final TextEditingController _specialisationController = TextEditingController();
    final TextEditingController _key_wordsController = TextEditingController();



     

       
  //      // String? getcurrent() {
  //      String getcurrent() { //here
      
  //    //  final curr = "lklkasjdlkfjasldkfjlkasdflkasdlkfjalksdfjlkj"; //ok
  //      var curr = getcurrentUser();
  //    // final curr = getcurrentUser();



  //    ////  print(curr);
  //      return curr;
  //  }
       
       Future<String?> getcurrentUser1() async {

         String? currentuser = "";
         String? currentuser_split = "";

        User? currentUser = await FirebaseAuth.instance.currentUser;
        print("current1");
        print(currentUser?.email);


            // var currentuser = currentUser?.email.toString();
               currentuser = currentUser?.email;
            // currentuser.split("@").first;

              //  final regEx = RegExp(r'(.+?)@');
              //  print(regEx.firstMatch(currentuser)!.group(1));

           return currentuser;
           //return currentuser_split;

       }






     // Future<void> getcurrentUser() async { ok
    // Future<String?> getcurrentUser() async { // here
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
                                    controller: _specialisationController,
                                    decoration: InputDecoration(
                                        labelText: 'Email',
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
                                    controller: _key_wordsController,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
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
                                            onTap: (){



                                              getcurrentUser().then( (value) {
                                                print("getcurrentUser --");
                                                print(value);

                                                //  String? value_split = value?.split("@").first;
                                                 String value_split = value!.split("@").first;

                                                 print(value_split);
                                                 var val_sp = value_split;
                                                 final valsp = val_sp;

                                                final databaseReference = FirebaseDatabase.instance.ref("specialisations");
                                                 //key
                                                    databaseReference.child(valsp).set({
                                                'specialisation': _specialisationController.text.toString(),
                                                'key_words': _key_wordsController.text.toString(),
                                                //  'id': 'cuser',
                                                //'id': cuser,
                                              });


                                              });

                                               // _register();

                                               print("lkjasdlkfjasdf");

                                                final cuser = getcurrentUser();//
                                               // String? str = cuser;

                                                 //final string_cuser = cuser.toString();
                                                
                                                //   final cuser_split = cuser.split("@").first;
                                                //  print(cuser_split);

                                                 // print(string_cuser);
                                                 print("getcurrentUser");
                                               print(cuser);

                                               print("------ lkjasldkjf");

                                                final bbccc = getcurrentUser1();
                                                print("getcurrentUser1");
                                                print(bbccc);


                                                // //getPass
                                                // final getPass = bbccc;
                                                // print(getPass.split("@").first);

                                               const string = 'Hello world!';
                                               final splitted = string.split(' ');
                                               print(splitted); // [Hello, world!];


                                                 String bbccc_string = bbccc.toString();
                                                 print("bbccc_string");
                                                 print(bbccc_string);
                                                //  final bbccc_string_split = bbccc_string.split("@").first;
                                                final bbccc_string_split = bbccc_string.split("@").first;
                                                var bbccc_string_split1 = bbccc_string_split;

                                                 print(bbccc_string_split);

                                              //  final string1 = bbccc;
                                              //  final splitted1 = string1.split("@").first;
                                              //  print(splitted1);

                                                //var bbbcccc = bbccc;
                                                


                                                // print(bbccc);
                                                // print("bbccc");


                                              //   databaseReference.child("lkjasd").set({
                                              //   'specialisation':"heart",
                                              //   'key_words':"heart problems",
                                              //   // 'id': "yerbaguy@gmail.com",
                                              //   'id': cuser,
                                              // });
 
                                               final cuserr = "yerbaguy@gmail.com";

                                              

                                                // final databaseReference = FirebaseDatabase.instance.ref("specialisations/$cuserr");
                                               
                                               ////here
                                              //  final databaseReference = FirebaseDatabase.instance.ref("specialisations");
                                               ////here

                                                //   databaseReference.set({
                                                //   'specialisation': _specialisationController.text.toString(),
                                                //   'key_words': _key_wordsController.text.toString(),
                                                // });

                                               // String cuserr = "yerbaguy@gmail.com";

                                              //  var key = 'yerbaguy';
                                                  var key = bbccc_string_split1;


                                                 ////here
                                              //    databaseReference.child(key).set({
                                              //   'specialisation': _specialisationController.text.toString(),
                                              //   'key_words': _key_wordsController.text.toString(),
                                              //   //  'id': 'cuser',
                                              //   //'id': cuser,
                                              // });
                                              ////here

                                              //    databaseReference.child("$cuserr").set({
                                              //   'specialisation': _specialisationController.text.toString(),
                                              //   'key_words': _key_wordsController.text.toString(),
                                              //   //  'id': 'cuser',
                                              //   //'id': cuser,
                                              // });


                                              // databaseReference.child("lkajs").set({
                                              //   'specialisation': _specialisationController.text.toString(),
                                              //   'key_words': _key_wordsController.text.toString,
                                              //   // 'id': "yerbaguy@gmail.com",
                                              //   'id': 1,
                                              // });
                                            },
                                            child: Center(
                                                child: Text(
                                                    'Register',
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