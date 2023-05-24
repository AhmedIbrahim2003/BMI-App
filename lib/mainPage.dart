import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'classes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        R1("Male"),
                        SizedBox(width: 15),
                        R1("Female"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      R2(),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        R3("Weight"),
                        SizedBox(width: 15),
                        R3("Age"),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 141, 13, 180),
                  ),
                  height: MediaQuery.of(context).size.height / 15,
                  width: 300,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResultPage()));
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 23),
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

  Expanded R1(String type) {
    var getdata= Provider.of<Test>(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            getdata.isMale = (type == 'Male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (getdata.isMale && type == 'Male') ||
                    (getdata.isMale == false && type == 'Female')
                ? Color.fromARGB(255, 224, 148, 247)
                : Color.fromARGB(255, 141, 13, 180),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == "Male" ? Icons.male : Icons.female,
                color: Colors.white,
                size: 90,
              ),
              SizedBox(height: 15),
              Text(
                type,
                style: TextStyle(fontSize: 30, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded R2() {
    var getdata= Provider.of<Test>(context);
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 141, 13, 180),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Text(
                  "Height",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(getdata.HeightValue.toStringAsFixed(0),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 45,
                            fontWeight: FontWeight.w700)),
                    Text("cm",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w700))
                  ],
                ),
                Slider(
                  activeColor: Color.fromARGB(255, 224, 148, 247),
                  inactiveColor: Color.fromARGB(255, 67, 7, 85),
                    min: 90,
                    max: 250,
                    value: getdata.HeightValue,
                    onChanged: (NewHeightValue) {
                      setState(() {
                        getdata.HeightValue = NewHeightValue;
                      });
                    })
              ],
            ),
          )),
    );
  }

  Expanded R3(String type3) {
    var getdata= Provider.of<Test>(context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 141, 13, 180)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type3,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w800)),
            SizedBox(height: 15),
            Text((type3 == "Weight" ? '${getdata.WeightValue}' : '${getdata.AgeValue}'),
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 224, 148, 247),
                    foregroundColor: Color.fromARGB(255, 141, 13, 180),
                    heroTag: type3 == "Weight" ? 'Weight++' : 'Age++',
                    onPressed: () {
                      setState(
                          () => type3 == "Weight" ? getdata.WeightValue++ : getdata.AgeValue++);
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 224, 148, 247),
                    foregroundColor: Color.fromARGB(255, 141, 13, 180),
                      heroTag: type3 == "Weight" ? 'Weight--' : 'Age--',
                      onPressed: () => setState(() {
                            type3 == "Weight"
                                ? (getdata.WeightValue > 0
                                    ? getdata.WeightValue--
                                    : getdata.WeightValue = 0)
                                : (getdata.AgeValue > 0 ? getdata.AgeValue-- : getdata.AgeValue = 0);
                          }),
                      child: Icon(Icons.remove))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
