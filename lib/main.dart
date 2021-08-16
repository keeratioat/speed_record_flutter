import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: CalculatePage(title: 'Speed Calculator'),
    );
  }
}

class CalculatePage extends StatefulWidget {
  CalculatePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _CalculatePage createState() => _CalculatePage();
}

class _CalculatePage extends State<CalculatePage> {
  double velocity ;
  double time;
  double speed;

  TextEditingController speedController = new TextEditingController();
  TextEditingController timeController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(widget.title),

      ),

      body: Container(
        child :SingleChildScrollView(
        child: Column(

          children: <Widget>[
            Padding(
              padding :EdgeInsets.symmetric(vertical: 8),
              child:Image.asset('assets/images/red_bull.png')),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
            child: Text("Speed Calculator" , style: TextStyle(fontSize: 22))),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: speedController,

                keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Speed/Km',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: TextField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Time',

                ),
              ),
            ),
            ElevatedButton(

              onPressed: () {
                actions:
                if(speedController.text.length == 0 || timeController.text.length == 0){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Speed Records"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Ok'),
                            child: Text('OK'),
                          ),],
                        content: Text("Plese enter velocity and time recommend time 0.63 velocity 31."),
                      );
                    },
                  );
                }
                else{
                  showDialog(

                  context: context,

                  builder: (context) {
                    speed = double.parse(speedController.text);
                    time = double.parse(timeController.text);
                    velocity = (speed / time) * 3600 / 1000;
                    return AlertDialog(
                      title: Text("Velocity is Calculated"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Ok'),
                          child: Text('OK'),
                        ),],
                      content: Text("Velocity is " + velocity.toString()),
                    );
                  },

                );}},
              child: Text('Calculate' , style:  TextStyle(fontSize: 16),),
            ),

          ],
        ),

      ),
    ),
    );
  }
}
