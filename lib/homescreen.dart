import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_async/result.dart';

// ignore: camel_case_types
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool ismale = true;

  double heightvar = 170;

  double weight = 50;

  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Body mass index'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(2),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          m1Expanded(context, 'male'),
                          const SizedBox(
                            width: 10,
                          ),
                          m1Expanded(context, 'female'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Height',
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                heightvar.toStringAsFixed(2),
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text(
                                'CM',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                          Slider(
                              min: 90,
                              max: 240,
                              value: heightvar,
                              onChanged: (newValue) =>
                                  setState(() => heightvar = newValue))
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          m2Expanded(context, 'age'),
                          const SizedBox(
                            width: 10,
                          ),
                          m2Expanded(context, 'wiedth'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.teal,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 16,
                    child: TextButton(
                        onPressed: () {
                          var result = weight / pow(heightvar / 100, 2);
                          print(result);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(
                                  result: result, age: age, ismale: ismale),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 16,
                          child: Text(
                            'Calculate',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ismale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: (ismale && type == 'male') || (!ismale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              Text(type == 'male' ? 'male' : 'female',
                  style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String ntype) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ntype == 'age' ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(
              height: 15,
            ),
            Text(ntype == 'age' ? '$age' : '$weight',
                style: Theme.of(context).textTheme.headline1),
            Center(
              child: Row(
                children: [
                  FloatingActionButton(
                    heroTag: ntype == 'age' ? 'age--' : 'weight--',
                    onPressed: () {
                      setState(() {
                        ntype == 'age' ? age-- : weight--;
                      });
                    },
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    heroTag: ntype == 'age' ? 'age++' : 'weight++',
                    onPressed: () {
                      setState(() {
                        ntype == 'age' ? age++ : weight++;
                      });
                    },
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
