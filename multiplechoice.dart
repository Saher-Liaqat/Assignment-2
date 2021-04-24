import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'selected_type.dart';
import 'my_flutter_app_icons.dart';
import 'true_false_quiz.dart';
import 'contactus.dart';
import 'constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'bouncinbutton.dart';



class multiplechoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("M C Qs"),
            actions: [IconButton(icon: Icon(MyFlutterApp.home), onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>selecttype()));

            })],
          ),
          drawer: Theme(
            data: Theme.of(context).copyWith( //This will change the drawer background to blue.
              canvasColor: Colors.transparent,
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
    backgroundColor: Colors.grey.shade900,
          body: WelcomeScreen(),
    ),
    );
  }
}

