import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardPage extends StatefulWidget {
  static const String id = "dashboard_page";
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  TextEditingController waterFlow = TextEditingController();
  String timeValue = '00:00';
  var time = const Duration(hours: 0, minutes: 0, seconds: 0);
  var timeToCalculate = 0;
  var priceValue = 0.0;
  var seconds = 0;
  var minutes = 0;
  var consumPerMinute = 0.0;
  String waterFlowValue = '00.00';

  changeText() {
    // function to calculate thwe water flow and time.
    // TODO: calculate the water flow and time. in a setTimeInterval
    Timer setTimeOut = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds = seconds + 1;
        if (seconds == 60) {
          seconds = 0;
          minutes = minutes + 1;
        }
        timeValue = minutes.toString() + ':' + seconds.toString();
        if (waterFlow.text != '' && waterFlow.text != '0') {
          var consumPerSecond = double.parse(waterFlow.text) / 60;
          var actualCosumValue = consumPerMinute + consumPerSecond;
          var price = actualCosumValue.toDouble() * 0.0044;
          priceValue = price;
          consumPerMinute = actualCosumValue.ceilToDouble();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromARGB(255, 13, 141, 161),
                Color.fromARGB(255, 25, 192, 210),
                Color.fromARGB(255, 33, 201, 243),
              ])),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text(
                          "Bem-vindo",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white, fontSize: 32.5),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Antony",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Informe a vazão de água",
                        style: TextStyle(
                            color: Color.fromARGB(255, 13, 141, 161),
                            fontSize: 24),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 45, right: 45, top: 20, bottom: 0),
                        child: TextFormField(
                          controller: waterFlow,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Vazão de água',
                              hintText: 'Ex: 7.5'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 20,
                                  spreadRadius: 10,
                                  offset: const Offset(0, 10))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tempo de uso",
                              style: TextStyle(
                                color: Color.fromARGB(255, 13, 141, 161),
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // text with the dinamic value of the time
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  minutes > 9
                                      ? minutes.toString()
                                      : "0" + minutes.toString(),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 13, 141, 161),
                                    fontSize: 40,
                                  ),
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 13, 141, 161),
                                    fontSize: 40,
                                  ),
                                ),
                                Text(
                                  seconds > 9
                                      ? seconds.toString()
                                      : "0" + seconds.toString(),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 13, 141, 161),
                                    fontSize: 40,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Consumo atual",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 13, 141, 161),
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              consumPerMinute.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 13, 141, 161),
                                  fontSize: 40),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "l/min",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 13, 141, 161),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      MaterialButton(
                        onPressed: () => changeText(),
                        height: 45,
                        minWidth: 240,
                        shape: const StadiumBorder(),
                        color: const Color.fromARGB(255, 5, 112, 124),
                        child: const Text(
                          "Iniciar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: const Text("Sair"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
