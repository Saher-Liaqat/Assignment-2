import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:quiz_app/true_false_quiz.dart';
import 'package:quiz_app/multiplechoice.dart';
import 'package:quiz_app/contactus.dart';
import 'package:quiz_app/bouncinbutton.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                ListTile(
                  title: Container(
                    child: Text('True or False (T/F)',style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.black, fontSize: 20.0),

                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>getjson2("True or False")),
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
                        .copyWith(color: Colors.black, fontSize: 20.0),

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
                        .copyWith(color: Colors.black, fontSize: 20.0),

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
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                   Text(
                    "Let's Play Quiz,",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Spacer(), // 1/6
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Enter your Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                    ),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Lets Play the Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
