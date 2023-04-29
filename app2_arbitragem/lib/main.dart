import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Arbitragem de poomsae'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 4.0;
  double _counterPresentation = 6.0;
  double velocityPower = 2.0;
  double rythmTime = 2.0;
  double expressionEnergy = 2.0;
  double _total = 0;
  String tel = '';
  String athlete = '';
  final _formKey = GlobalKey<FormState>();
  final NumberFormat format = NumberFormat("0.00");
  void _incrementCounter(double value) {
    setState(() {
      _counter += value;
    });
  }

  void _decrementCounter(double value) {
    setState(() {
      _counter -= value;
    });
  }

  void _calculatePresentation() {
    setState(() {
      _counterPresentation = (velocityPower + rythmTime + expressionEnergy);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: 10.0,
                            top: 25.0 + MediaQuery.of(context).padding.top,
                            bottom: 5.00),
                        child: const Text("Numero De telefone")),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 5, 5, 92),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value == '') {
                            return "o numero de Telefone é obrigatório";
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            tel = text;
                          });
                        },
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 10.0,
                            top: 25.0 + MediaQuery.of(context).padding.top,
                            bottom: 5.00),
                        child: const Text("Nome do Atleta")),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 5, 5, 92),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value == '') {
                            return "o Nome do Atleta é obrigatório";
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            athlete = text;
                          });
                        },
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Precisão",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            format.format(_counter),
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal:
                                (MediaQuery.of(context).size.width * 0.1)),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                                Size(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.3,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.2)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          const Color.fromARGB(
                                              232, 21, 142, 223),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_counter < 0.3) {
                                          null;
                                        } else {
                                          _decrementCounter(0.30);
                                        }
                                      },
                                      child: const Text(
                                        "-0.3",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        Size(
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                            MediaQuery.of(context).size.width *
                                                0.2)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color.fromARGB(232, 21, 142, 223),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_counter >= 4.0) {
                                      null;
                                    } else {
                                      _incrementCounter(0.30);
                                    }
                                  },
                                  child: const Text(
                                    "+0.3",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2)),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(232, 21, 142, 223),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_counter <= 0.0) {
                                        null;
                                      } else {
                                        _decrementCounter(0.10);
                                      }
                                    },
                                    child: const Text(
                                      "-0.1",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        Size(
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                            MediaQuery.of(context).size.width *
                                                0.2)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color.fromARGB(232, 21, 142, 223),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_counter >= 4.0) {
                                      null;
                                    } else {
                                      _incrementCounter(0.10);
                                    }
                                  },
                                  child: const Text(
                                    "+0.1",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Apresentação",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            format.format(_counterPresentation),
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                    "Potencia e velocidade",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Slider(
                                        value: velocityPower,
                                        onChanged: (newRating) {
                                          setState(() {
                                            velocityPower = newRating;
                                          });
                                          _calculatePresentation();
                                        },
                                        divisions: 20,
                                        min: 0.5,
                                        max: 2.0,
                                      ),
                                      Text(
                                        format.format(velocityPower),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                    "Ritmo e Tempo",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Slider(
                                        value: rythmTime,
                                        onChanged: (newRating) {
                                          setState(() {
                                            rythmTime = newRating;
                                          });
                                          _calculatePresentation();
                                        },
                                        divisions: 20,
                                        min: 0.5,
                                        max: 2.0,
                                      ),
                                      Text(
                                        format.format(rythmTime),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                    "Expressão de Energia",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Slider(
                                        value: expressionEnergy,
                                        onChanged: (newRating) {
                                          setState(() {
                                            expressionEnergy = newRating;
                                          });
                                          _calculatePresentation();
                                        },
                                        divisions: 20,
                                        min: 0.5,
                                        max: 2.0,
                                      ),
                                      Text(
                                        format.format(expressionEnergy),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (tel != "" && athlete != "") {
                    _total = _counter + _counterPresentation;
                    var whatsappUrl =
                        "whatsapp://send?phone=+55$tel&text=$athlete%20nota%20-%3E%20$_total%20";

                    if (await canLaunchUrlString(whatsappUrl)) {
                      await launchUrlString(whatsappUrl);
                    } else {
                      throw 'Could not launch $whatsappUrl';
                    }
                  } else {
                    var texto = 'Favor preencher o(s) campo(s):';
                    if (tel == "") {
                      texto += "\n Telefone";
                    }
                    if (athlete == "") {
                      texto += "\n Atleta";
                    }

                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: const Text("Error"),
                              content: Text(texto),
                            )));
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  minimumSize:
                      MaterialStateProperty.all(const Size(10.0, 50.0)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 5, 5, 92),
                  ),
                ),
                child: const Text(
                  "Enviar",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
