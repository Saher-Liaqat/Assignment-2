import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/contactus.dart';
import 'true_false_quiz.dart';
import 'multiplechoice.dart';
import 'my_flutter_app_icons.dart';
import 'constants.dart';
import 'bouncinbutton.dart';
class selecttype extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(


      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: Scaffold( backgroundColor: Colors.blueGrey.shade700,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
          title: Text("Please select the Quiz type first!"),
          actions: [IconButton(icon: Icon(MyFlutterApp.home), onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>selecttype()));

          })],
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith( //This will change the drawer background to blue.
            canvasColor: Colors.blueGrey.shade700,
          ),
          child: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text("           Saher Liaqat", style: TextStyle(
                      fontSize: 25.0,
                      fontWeight:FontWeight.bold
                    ),),
                    accountEmail: Text("          FA17-BCS-080", style: TextStyle(
                        fontSize: 25.0,
                        fontWeight:FontWeight.bold
                    ),),
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.blueGrey.shade700,
                            Colors.blueGrey.shade700,
                          ],

                          stops: [0.0, 1.0],
                          ),
                    ),

                  ),

                  SizedBox(
                    width: 2.0,
                    height: 2.0,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                      ),
                    ),
                  ),
                  ListTile(

                    title: Container(

                      child: Text('True or False (T/F)',style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white, fontSize: 20.0),

                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => getjson2("True or False")),
                      );

                    },
                  ),
                  SizedBox(
                    width: 2.0,
                    height: 2.0,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                      ),
                    ),
                  ),

                  ListTile(
                    title: Container(

                      child: Text('Multiple choice questions (MCQs)',style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black, fontSize: 20.0),

                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => multiplechoice()),
                      );

                    },
                  ),
                  SizedBox(
                    width: 2.0,
                    height: 2.0,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                      ),
                    ),
                  ),

                  ListTile(
                    title: Container(

                      child: Text('Contact Us',style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white, fontSize: 20.0),

                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => contactus()),
                      );

                    },
                  ),
                  SizedBox(
                    width: 2.0,
                    height: 2.0,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Container(


                      child: Text('Animation Button',style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white, fontSize: 20.0),

                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BouncingButton()),
                      );

                    },
                  ),
                  SizedBox(
                    width: 2.0,
                    height: 2.0,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                      ),
                    ),
                  ),

                ],
              )
          ),
        ),
        body: Center(


          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                child: Text(
                  "Lets start the Quiz,",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                margin: EdgeInsets.all(80),
                child: TextButton(

                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                    ),
                    child: Text(
                      "True or False(T/F) ",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black),
                    ),
                  ),
                    onPressed:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>getjson2("True or False")));
                    }
                ),
              ),
              Container(
                margin: EdgeInsets.all(80),
                child: TextButton(
                  child: Container( width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,

                    ),
                    child: Text("Multiple choice questions (MCQs)",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black),),
                    ),
                    onPressed:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>multiplechoice()));
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
