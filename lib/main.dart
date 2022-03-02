import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TEST APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const MyHomePage(title: 'TEST APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();

  int charLength1 = 0;  //right char count
  int charLength2 = 0;  //left char count

  //To get the left char count
  _leftOnChanged(String value) {
    setState(() {
      charLength1 = value.length;

    });
  }
  //To get the right char count
  _rightOnChanged(String value) {
    setState(() {
      charLength2 = value.length;

    });
  }

  @override
  Widget build(BuildContext context) {
    final screenW=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title))
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: <Widget>[
            Container(
              width: screenW*0.45,
              height: 200,
              decoration: BoxDecoration(
                 border: Border.all(),
               ),
           child: Padding(
              padding: EdgeInsets.all(5),
      child: TextField(
        controller: textController1,
        autocorrect: true,
            decoration: InputDecoration(
              border: InputBorder.none,
      ),
        onChanged: _leftOnChanged,
      ),
    ),
    ),
    Container(
      width: screenW*0.45,
      height: 200,
      decoration: BoxDecoration(
            border: Border.all(),
      ),
      child: Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
        controller: textController2,
        autocorrect: true,
            decoration: InputDecoration(
              border: InputBorder.none,

            ),
        onChanged: _rightOnChanged,
      ),
      ),
    ),
    ],
    ),
            SizedBox(height: 60,),

            (charLength2!=charLength1)? new RotationTransition(
              turns: new AlwaysStoppedAnimation((charLength2>charLength1)?15/360:-15/360),
              child: _tiltBar(charLength1,charLength2,screenW)
            ): _tiltBar(charLength1,charLength2,screenW)
          ],
        ),
    )
    );
  }
}


Widget _tiltBar(int lLen,int rLen,double screenW){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
        height: 50,
        width: screenW*0.90,
        color: Colors.blue,

        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5,left: 5),
              child: Container(
                child: Center(child: Text("$lLen", style: TextStyle(fontSize: 20)))
                ,
                height: 50,
                width: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(width: screenW*0.90-130,),
            Padding(
              padding: EdgeInsets.only(top: 5,bottom: 5, right: 5 ),
              child: Container(
                  child: Center(child: Text("$rLen", style: TextStyle(fontSize: 20))),
                  height: 50,
                  width: 60,
                  color: Colors.white
              ),
            )
          ],
        ),
    ),
  );
}
