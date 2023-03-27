import 'package:flutter_with_bloc/src/color_bloc/color_bloc.dart';
import 'package:flutter_with_bloc/src/color_bloc/color_event.dart';
import 'package:flutter_with_bloc/src/color_bloc/color_state.dart';
import 'package:flutter_with_bloc/src/counter_bloc/counter_bloc.dart';
import 'package:flutter_with_bloc/src/counter_bloc/counter_event.dart';
import 'package:flutter_with_bloc/src/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          BlocBuilder<ColorBloc, ColorState>(
            builder: (context, state) {
              return Container(
                color: state.color,
                height: 100,
                width: 100,
              );
            },
          ),
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementEvent());
              context.read<ColorBloc>().add(ColorDecrementEvent());
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementEvent());
              context.read<ColorBloc>().add(ColorIncrementEvent());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
