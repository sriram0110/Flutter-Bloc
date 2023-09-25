import 'package:bloc_state_management/Counter-App/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: const CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App BLoC'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
        return Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                    ),
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(IncrementEvent()),
                    child: const Icon(Icons.add)),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(DecrementEvent()),
                    child: const Icon(Icons.remove))
              ],
            ),
          ],
        );
      }),
    );
  }
}
