import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'classes.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    var getdata = Provider.of<Test>(context);
    var bmi = getdata.bmiCalculation();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 141, 13, 180),
          title: Text(
            "Your results",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 40),
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 141, 13, 180),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  getdata.DataPrint("Gender: ",
                                      "${getdata.isMale == true ? "Male" : "Female"}"),
                                  getdata.DataPrint("Height: ",
                                      "${getdata.HeightValue.toStringAsFixed(0)}"),
                                ],
                              ),
                              Column(
                                children: [
                                  getdata.DataPrint(
                                      "Weight: ", "${getdata.WeightValue}"),
                                  getdata.DataPrint("Age: ", "${getdata.AgeValue}"),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 141, 13, 180),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "You are:",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30),
                          ),
                          getdata.BmiPrint(bmi),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "Your BMI is",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 30),),
                                TextSpan(text: " ${bmi.toStringAsFixed(1)}",style: TextStyle(color: getdata.BmiColor(bmi),fontSize: 30,fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 141, 13, 180),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Your ideal weight is:",style: TextStyle(color: Colors.white,fontSize: 30)),
                          Text("${getdata.minWeight().toStringAsFixed(1)} ~ ${getdata.maxWeight().toStringAsFixed(1)}",style: TextStyle(color: Colors.black,fontSize: 50),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
