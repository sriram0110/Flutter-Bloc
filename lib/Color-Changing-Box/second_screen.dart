import 'package:bloc_state_management/Color-Changing-Box/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2 Screen'),
      ),
      body: BlocBuilder<ColorBloc, ColorState>(
        buildWhen: (previous, current) => current is TextUpdateState,
        builder: (context, state) {
          if (state is TextUpdateState) {
            return Center(
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(state.textChange!, style: const TextStyle(fontSize: 24),),
              ]),
            );
          } else {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context).add(ChangeText());
                  },
                  child: const Text('Greetings')),
            );
          } 
        },
      ),
    );
  }
}
