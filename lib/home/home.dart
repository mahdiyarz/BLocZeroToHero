import 'package:flutter/material.dart';

import '../bloc/bloc_imports.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text('Counter Value ${state.counterValue}');
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterIncrementEvent()),
                  child: const Text('Increase')),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterDecrementEvent()),
                  child: const Text('Decrease')),
            ],
          )
        ],
      ),
    );
  }
}
