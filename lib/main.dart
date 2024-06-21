import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp2());
}


class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "実践演習アプリ",
      home: MyHome());
  }
} 


class MyHome extends StatefulWidget{
  const MyHome({super.key});
  @override
  _MyHomeState createState() {
    return _MyHomeState();
  }  
}


class _MyHomeState extends State<MyHome> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("実践演習アプリ")),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            setState(() {  
              count = 0;
            })
          }, child: Icon(Icons.airport_shuttle_outlined)),

        body: Column(
          children: [
            Text("$count", style: TextStyle(fontSize: 80)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BinDigit(),
                BinDigit(),
                BinDigit(),
                BinDigit(),
                BinDigit(),
                BinDigit(),
                BinDigit(),
                BinDigit()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                  setState(() {
                    count ++;
                  });
                  }, 
                  child: Icon(Icons.plus_one)),

                ElevatedButton(
                  onPressed: () {
                    setState(() => count --);
                  }, 
                  child: Icon(Icons.exposure_minus_1)),
            ],
          )
        ],)
      );
  }
}


class BinDigit extends StatelessWidget {
  const BinDigit({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Text("0");
  }
}
