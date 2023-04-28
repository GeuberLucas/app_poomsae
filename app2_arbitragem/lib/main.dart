import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  double _Total = 0;
  String tel = '';
  String athlete = '';
  final _formKey = GlobalKey<FormState>();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null || value == '') {
                      return "Campo telefone";
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      tel = text;
                    });
                  },
                  //decoration: const InputDecoration(border: InputBorder.none),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value == '') {
                      return "nome Atleta é obrigatorio";
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      athlete = text;
                    });
                  },
                  //decoration: const InputDecoration(border: InputBorder.none),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _counter.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            if (_counter <= 0.0) {
                              null;
                            } else {
                              _decrementCounter(0.30);
                            }
                          },
                          tooltip: 'Dencrement',
                          child: const Text("-0.3"),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            if (_counter >= 4.0) {
                              null;
                            } else {
                              _incrementCounter(0.30);
                            }
                          },
                          tooltip: 'Increment',
                          child: const Text("+0.3"),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            if (_counter <= 0.0) {
                              null;
                            } else {
                              _decrementCounter(0.10);
                            }
                          },
                          tooltip: 'Dencrement',
                          child: const Text("-0.1"),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            if (_counter >= 4.0) {
                              null;
                            } else {
                              _incrementCounter(0.10);
                            }
                          },
                          tooltip: 'Increment',
                          child: const Text("+0.1"),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _counterPresentation.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
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
                      min: 0,
                      max: 2.0,
                    ),
                    Slider(
                      value: rythmTime,
                      onChanged: (newRating) {
                        setState(() {
                          rythmTime = newRating;
                        });
                        _calculatePresentation();
                      },
                      divisions: 20,
                      min: 0,
                      max: 2.0,
                    ),
                    Slider(
                      value: expressionEnergy,
                      onChanged: (newRating) {
                        setState(() {
                          rythmTime = newRating;
                        });
                        _calculatePresentation();
                      },
                      divisions: 20,
                      min: 0,
                      max: 2.0,
                    )
                  ],
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              _Total = _counter + _counterPresentation;
              var whatsappUrl =
                  "whatsapp://send?phone=+55$tel&text=$athlete%20nota%20-%3E%20$_Total%20";

              if (await canLaunchUrlString(whatsappUrl)) {
                await launchUrlString(whatsappUrl);
              } else {
                throw 'Could not launch $whatsappUrl';
              }
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(const Size(10.0, 50.0)),
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
    );
  }
}

class _MyHomePage2State extends State<MyHomePage> {
  double percent = 0.75;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Form(
            child: Column(
              children: <Widget>[
                //profile area

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_note, size: 28),
                    )
                  ],
                ),
                const Text(
                  "Software Developer",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                //Task area
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.036),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text(
                                "My tasks",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "On Going",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                          ),
                          Column(
                            children: [
                              FloatingActionButton(
                                backgroundColor: const Color(0xff03dac6),
                                foregroundColor: Colors.black,
                                onPressed: () {},
                                child: const Icon(Icons.calendar_today),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.026,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          color: Colors.orangeAccent),
                                      child: const Icon(
                                        Icons.star,
                                        color: Colors.redAccent,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.040,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "High Priorities",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "12 Completed . 4 Not yet",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.width *
                                      0.050),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(360),
                                            color: Colors.greenAccent),
                                        child: const Icon(
                                          Icons.event,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.040,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "In Schedule",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Nunito",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "18 Completed . 6 Completed",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Nunito",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(360),
                                            color: Colors.blueAccent),
                                        child: const Icon(
                                          Icons.query_builder,
                                          color: Colors.lightGreenAccent,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.040,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "today",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "2 Completed . 9 Completed",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //Graphics area
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                  color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 5.0,
                          animation: true,
                          percent: percent,
                          reverse: true,
                          center: Text(
                            "${percent * 100}%",
                            style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          backgroundColor: Colors.amberAccent,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.white,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 75)),
                      const Text("Sport",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      const Text("2 task for today",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
