import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

Future<void> main(List<String> args) async {
  final cubit = CounterCubit();

  final streamSubscription = cubit.stream.listen(print);

  cubit.increment();
  cubit.increment();

  await Future.delayed(Duration.zero);
  await streamSubscription.cancel();
  await cubit.close();
}

// void main(List<String> args) {
//   final cubit = CounterCubit();
//   print(cubit.state); //* showing 0

//   cubit.increment();
//   print(cubit.state);

//   cubit.increment();
//   print(cubit.state);

//   cubit.decrement();
//   print(cubit.state);

//   cubit.close();
// }
