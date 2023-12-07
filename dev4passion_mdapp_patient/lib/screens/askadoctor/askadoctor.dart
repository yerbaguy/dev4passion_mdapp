import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Askadoctor extends StatefulWidget {

   // CollectionReference ask = FirebaseFirestore.instance.collection('askadoctor');
   // DatabaseReference ref = FirebaseDatabase.instance.ref("askadoctor");

  const Askadoctor({ Key? key }) : super(key: key);

  @override
  _AskadoctorState createState() => _AskadoctorState();
}

class _AskadoctorState extends State<Askadoctor> {

     CollectionReference askadoctor = FirebaseFirestore.instance.collection('askadoctor');


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

    void _askAQuestion() async {

        print(_ageController.text.toString());
        print(_nameController.text.toString());
        print(_countryController.text.toString());
        print(_languageController.text.toString());
        print(_medical_historyController.text.toString());
        print(_detailsController.text.toString());

        await askadoctor.add({
            'age': _ageController.text.toString(),
            'name': _nameController.text.toString(),
            'country': _countryController.text.toString(),
            'language': _languageController.text.toString(),
            'medical_history': _medical_historyController.text.toString(),
            'details': _detailsController.text.toString(),

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
                                            onTap: (){

                                               // _register();
                                               _askAQuestion();
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