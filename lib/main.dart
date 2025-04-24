import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 17, 72, 221)),
      ),
      home: const MyHomePage(title: 'Comparador Antes e Depois'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: AnimatedCrossFadeExample(),
      ),
    );
  }
}

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _showSecond = false;

  void _toggleCrossFade() {
    setState(() {
      _showSecond = !_showSecond;
    });
  }

  @override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AnimatedCrossFade(
        duration: const Duration(milliseconds: 800),
        sizeCurve: Curves.easeInOut,
        firstChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bateria.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Antes',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ],
        ),
        secondChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bateria1.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Depois',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
          ],
        ),
        crossFadeState: _showSecond
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: _toggleCrossFade,
        child: const Text('Alternar'),
      ),
    ],
  );
}
}