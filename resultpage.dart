import 'package:flutter/material.dart';
import 'selected_type.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

String Quiz;

class _resultpageState extends State<resultpage> {
  String message;

  @override
  void initState() {
    if (marks < 20) {
      message = "You Should Try Hard..\n" + "You Scored $marks";
    } else if (marks < 35) {
      message = "You Can Do Better..\n" + "You Scored $marks";
    } else {
      message = "You Did Very Well..\n" + "You Scored $marks";
    }

    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Results',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),

        // leading: IconButton(
        //  icon: Icon(Icons.menu),
        //onPressed: () {
        // NavDrawer();
        //},
        // ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Center(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 18.0,

                ),
              ),
            )),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => selecttype(),
                        ));
                      },
                      child: Text(
                        "Go to Home Page",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                      splashColor: Colors.tealAccent,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
