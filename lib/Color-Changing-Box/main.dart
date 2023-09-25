import 'package:bloc_state_management/Color-Changing-Box/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (BuildContext context) => ColorBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ColorScreen(),
      ),
    );
  }
}

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ColorBloc>(context) .add(InitialEvent());
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Color Changing BLoC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<ColorBloc, ColorState>( 
              listenWhen: (context, state) => state is ColorUpdateState,
              listener: (context, state) {
                if (state is ColorUpdateState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Color Updated'),
                    backgroundColor: Colors.green,
                  ));
                  Future.delayed(const Duration(seconds: 1),
                      () => ScaffoldMessenger.of(context).clearSnackBars());
                }
              },
              builder: (context, state) {
                if (state is ColorUpdateState) {
                  return Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: state.initialState == true
                            ? Colors.blue
                            : Colors.red,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                BlocProvider.of<ColorBloc>(context).add(ColorToBlue()),
                            child: Container(
                              width: 50,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                              ),
                              child: const Center(child: Text('blue')),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () =>
                                BlocProvider.of<ColorBloc>(context).add(ColorToRed()),
                                
                            child: Container(
                              width: 50,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                              child: const Center(child: Text('red')),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SecondScreen()));
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen(),));
                          },
                          icon: const Icon(Icons.arrow_right),
                          label: const Text('Next'))
                    ],
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
