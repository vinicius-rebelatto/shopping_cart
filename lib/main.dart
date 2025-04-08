import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/main_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ShoopingApp());
}

class ShoopingApp extends StatelessWidget {
  const ShoopingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.highContrastDark(),//fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerDelegate: AppRouter(),
      routeInformationParser: const RouteInformationParserImpl(),
    );
  }
}

// Parser simples para rotas
class RouteInformationParserImpl extends RouteInformationParser<List<RouteSettings>> {
  const RouteInformationParserImpl();

  @override
  Future<List<RouteSettings>> parseRouteInformation(RouteInformation routeInformation) async {
    return [RouteSettings(name: routeInformation.location)];
  }

  @override
  RouteInformation restoreRouteInformation(List<RouteSettings> configuration) {
    return RouteInformation(location: configuration.last.name);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,//Theme.of(context).colorScheme.inversePrimary,//Colors.amber
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
