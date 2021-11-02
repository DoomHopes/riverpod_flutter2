import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class IncrementNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value += 1;
    notifyListeners();
  }
}

//final greatingProvider = Provider((ref) => 'Helo Riverpod');
final incrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());

/*class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final greating = watch(greatingProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod'),
          centerTitle: true,
        ),
        body: Center(child: Text(greating)),
      ),
    );
  }
}*/

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod'),
          centerTitle: true,
        ),
        body: Center(
          child: Consumer(
            builder: (context, watch, child) {
              final greating = watch(greatingProvider);
              return Text(greating);
            },
          ),
        ),
      ),
    );
  }
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod',
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, watch, child) {
              final incrementNotifier = watch(incrementProvider);
              return Text(
                incrementNotifier.value.toString(),
                style: const TextStyle(
                  fontSize: 25,
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(incrementProvider).increment();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
