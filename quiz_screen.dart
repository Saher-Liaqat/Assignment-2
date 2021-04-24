import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'components/body.dart';
import 'package:quiz_app/my_flutter_app_icons.dart';
import 'package:quiz_app/selected_type.dart';
import 'package:quiz_app/true_false_quiz.dart';
import 'package:quiz_app/multiplechoice.dart';
import 'package:quiz_app/contactus.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/score/score_screen.dart';
import 'package:quiz_app/bouncinbutton.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        title: Text("Select your answer for next mcqs"),
        actions: [
          IconButton(icon: Icon(MyFlutterApp.home), onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>selecttype()));
        })
        ],

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
                          Colors. blueGrey.shade700,
                          Colors. blueGrey.shade700,

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

                    child: Text('True or False(T/F)',style: Theme.of(context)
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
                        .copyWith(color: Colors.white, fontSize: 20.0),

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
                ListTile(
                  title: Container(

                    child: Text('Exit',style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.white, fontSize: 20.0),

                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScoreScreen()),
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

      body: Body(),
    );
  }
}
