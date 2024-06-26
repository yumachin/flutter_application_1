import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp2());
}


class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});
  @override

  Widget build(BuildContext context) {
    return const MaterialApp(
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
        appBar: AppBar(

          //<h1>的な感じ
          title: const Text("実践演習アプリ", style: TextStyle(fontSize: 40),),
          centerTitle: true,
        ),

        //リセットボタン作成
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() =>  
              count = 0
            );
          }, 
          child: const Icon(Icons.airport_shuttle_outlined)),

        //ボディー開始
        body: Column(

          children: [

            //カウント値表示
            Text("$count", style: const TextStyle(fontSize: 140)),

            //カウント値と2進数間にスペース設置
            const SizedBox(height: 50,),

            //２進数表記
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ([7,6,5,4,3,2,1,0].map((i){
                return BinDigit(value: count, digit: i);
              })).toList()
            ),

            //2進数とボタン間にスペース設置
            const SizedBox(height: 90,),

            //増減ボタン作成
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //+ボタン
                ElevatedButton(
                  onPressed: () {
                    setState(() {count ++;});
                  }, 
                  child: Icon(Icons.plus_one, size: 50),
                ),

                //ボタン間にスペース追加
                SizedBox(width: 75,),

                //－ボタン
                ElevatedButton(
                  onPressed: () {
                    setState(() => count --);
                  }, 
                  child: Icon(Icons.exposure_minus_1, size: 50,)
                ),
              ],
            )
          ],
        )
      );
  }
}


class BinDigit extends StatelessWidget {
  final int value;
  final int digit;
  const BinDigit({super.key, required this.value, required this.digit});

  @override
  Widget build(BuildContext context) {
      return Text((value & (1 << digit) != 0) ? "1" : "0",
      //2進数表記の数字を大きくする
      style:TextStyle(fontSize: 40));
  }
}
