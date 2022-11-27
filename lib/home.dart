import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  static const String id = "dashboard_page";
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
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
                        child: const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Vazão'),
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
                          children: const [
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
                            Text(
                              "00:00:00",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 30,
                              ),
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
                              "0.00",
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
                        onPressed: () {},
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
