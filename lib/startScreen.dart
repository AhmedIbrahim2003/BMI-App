import 'package:bmi/mainPage.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

var backcolor = const Color.fromARGB(255, 97, 93, 93);
var textcolor = Colors.black;

class _StartScreenState extends State<StartScreen> {
  // void mainScreenNav (BuildContext ctx){
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(builder: (context)=> const MainPage())
  //   );
  // }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: textcolor,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/photos/bodybuilder2.png'),
                  fit: BoxFit.fitHeight)),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Builder(
                builder: (context) {
                  return Positioned(
                    bottom: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(120, 25, 120, 25)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 141, 13, 180))),
                      child: const Text(
                        "Start",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
              const Positioned(
                bottom: 150,
                child: Text(
                  "Welcome to \nBMI calculator",
                  style: TextStyle(
                    color: Color.fromARGB(255, 141, 13, 180),
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
