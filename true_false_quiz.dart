import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultpage.dart';
import 'selected_type.dart';
import 'constants.dart';
import 'truefalseProgressbar.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'contactus.dart';
import 'multiplechoice.dart';
import 'my_flutter_app_icons.dart';
import 'package:get/get.dart';
import 'bouncinbutton.dart';

class getjson2 extends StatelessWidget {
  // accept the langname as a parameter

  String langname;
  getjson2(this.langname);
  String assettoload;

  // a function
  // sets the asset to a particular JSON file
  // and opens the JSON
  setasset() {
    if (langname == "True or False") {
      assettoload = "assets/fortruefalse.json";
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    // this function is called before the build so that
    // the string assettoload is avialable to the DefaultAssetBuilder
    setasset();
    // and now we return the FutureBuilder to load and decode JSON
    return FutureBuilder(
      future:
      DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(
                "Page Loading",
              ),
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  final List mydata;

  quizpage({Key key, @required this.mydata}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  QuestionController _questionController = Get.put(QuestionController());
  final List mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.blueGrey;
  Color right = Colors.greenAccent;
  Color wrong = Colors.redAccent;
  int marks = 0;
  int i = 1;
  bool disableAnswer = false;
  // extra varibale to iterate
  int j = 1;
  int timer = 30;

  var random_array;

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
  };

  bool canceltimer = false;

  // code inserted for choosing questions randomly
  // to create the array elements randomly use the dart:math module
  // -----     CODE TO GENERATE ARRAY RANDOMLY

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10));
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  //   var random_array;
  //   var distinctIds = [];
  //   var rand = new Random();
  //     for (int i = 0; ;) {
  //     distinctIds.add(rand.nextInt(10));
  //       random_array = distinctIds.toSet().toList();
  //       if(random_array.length < 10){
  //         continue;
  //       }else{
  //         break;
  //       }
  //     }
  //   print(random_array);

  // ----- END OF CODE
  // var random_array = [1, 6, 7, 2, 4, 10, 8, 3, 9, 5];

  // overriding the initstate function to start timer as this screen is created
  @override
  void initState() {
    starttimer();
    genrandomarray();
    super.initState();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
          _questionController.onInit();

        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }

      });
    });
  }

  void nextquestion() {
    _questionController.onInit();
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.blueGrey;
      btncolor["b"] = Colors.blueGrey;

      disableAnswer = false;
    });
    starttimer();
  }

  void checkanswer(String k) {
    // in the previous version this was
    // mydata[2]["1"] == mydata[1]["1"][k]
    // which i forgot to change
    // so nake sure that this is now corrected
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2][i.toString()] + " is equal to " + mydata[1][i.toString()][k]);
      marks = marks + 5;
      // changing the color variable to be green
      colortoshow = right;
    } else {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2]["1"] + " is equal to " + mydata[1]["1"][k]);
      colortoshow = wrong;
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });
    // nextquestion();
    // changed timer duration to 1 second
    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
        decoration: BoxDecoration(
          gradient: kPrimaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: MaterialButton(
          onPressed: () => checkanswer(k),
          child: Text(
            mydata[1][i.toString()][k],
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Alike",
              fontSize: 16.0,
            ),
            maxLines: 1,
          ),
          color: btncolor[k],
          splashColor: Colors.indigo[700],
          highlightColor: Colors.indigo[700],
          minWidth: 200.0,
          height: 45.0,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                " Quiz App",
              ),
              content: Text("Please keep playing"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                  ),
                )
              ],
            ));
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("True or False"),
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

                      child: Text('Leave',style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white, fontSize: 20.0),

                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => selecttype()),
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
        body: Column(
          children: <Widget>[

            Expanded(

              child:Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: ProgressBarTF(),

                  ),

                ],


              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
                  style: TextStyle(
                    fontSize: 16.0,

                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: AbsorbPointer(
                absorbing: disableAnswer,
                child: Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      choicebutton('a'),
                      choicebutton('b'),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
