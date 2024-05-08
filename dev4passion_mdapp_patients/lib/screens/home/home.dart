import 'package:flutter/material.dart';


import 'dart:io';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:dev4passion_mdapp_patient/screens/authenticate/home.dart';
import 'package:dev4passion_mdapp_patients/screens/signin/signin.dart';
import 'package:dev4passion_mdapp_patients/screens/askadoctor/askadoctor.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();



class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String status = "";

  void initState() {
    super.initState();

    status = "Not authenticated";
  }

   void signInAnon() async {
    User? user = (await auth.signInAnonymously()).user;
     if (user!= null && user.isAnonymous == true) {
        setState((){
            status = "Signed In Anonymously";
        });
            } else {
                status = "Sign In failed";
            }
  }

  void signOut() async {
      await auth.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
    //User? user = await auth.signOut();

   // print(user);


    // if(user!=null && user.signOut == true) {
   
    // setState((){
    //     status = "Signed Out";
    // });
   
    //}
  }


  @override
  Widget build(BuildContext context) {
    // return Container(
      
    // );


    return Scaffold(
      // drawer: Sidemenu(),
     // drawer: SideMenu(),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title),
        title: Text("HOME"),
        backgroundColor: Colors.pinkAccent,
        
        actions: <Widget>[
            TextButton(onPressed: 
            (){
                // signInAnon();
                signOut();
                

                print("register");
            },
            child: Text("Anonymous Signout"),
            ),
        ],
      ),
    
         body: new Container (
            padding: new EdgeInsets.all(32.0),
            child: new Column(
                children: <Widget> [
                    new Text(status),
                    new Row (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxissAlignment: CrossAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                            //ok
                            // MaterialButton( onPressed: signOut, child: Text('Sign Out')),

                            // MaterialButton( onPressed: signInAnon, child: Text('Sign In Anon')),
                            //ok
                         
                         
                         
                           // MaterialButton( onPressed: signinanon, child: Text('Sign In Anoon'),),

             
           


                            // RaisedButton(onPressed: signOut, child: Text('Sign Out'),),
                            ////
                            // RaisedButton(onPressed: signOut, child: Text('Sign Out'),),
                            // RaisedButton(onPressed: signInAnon, child: Text('Sin In Anon'),),
                            ////
                        ],
                    ),

                    Container(
                        padding: EdgeInsets.fromLTRB(15,18,0,0),
                        child: Text("Hello",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold
                        )),
                    ),

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
                                               // _signIn();
                                            Navigator.of(context).pushNamed('/askadoctor');

                                            },
                                            child: Center(
                                                child: Text(
                                                    'Ask a doctor',
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

                ],
            ),
         ),
    //   body: Center(
    //     // Center is a layout widget. It takes a single child and positions it
    //     // in the middle of the parent.
    //     child: Column(
        
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text(
    //           'You have pushed the button this many times lkasjdflkjasd:', style: TextStyle(fontSize: 40),
    //         ),
           
    //       ],
    //     ),
    //   ),


      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}