import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.age, required this.ismale})
      : super(key: key);

  final double result;
  final int age;
  final bool ismale;

  String get resultphrase {
    // ignore: unused_local_variable
    String resultText = '';
    if (result >= 30) {
      resultText = ('Obase');
    } else if (result > 25 && result < 30) {
      resultText = ('Overweight');
    } else if (result >= 18.5 && result < 24.9) {
      resultText = ('Normal');
    } else {
      resultText = ('thin');
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Result',
          ),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender : ${ismale ? 'male' : 'famale'}',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'age : $age',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 8,
              ),
              Text('result : ${result.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headline1),
              Text(
                'Healthiness : $resultphrase',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )));
  }
}
