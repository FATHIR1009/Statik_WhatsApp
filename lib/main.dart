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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp"),
          backgroundColor: Colors.green,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.circle_outlined)),
              Tab(icon: Icon(Icons.call)),
            ],
          ),
        ),
        body: const TabBarView(

          children: [
            Column(
              children: [
            Card(
            elevation: 5,
            child:  ListTile(
              leading: Icon(Icons.person),
              title: Text("Ahmad ganteng"),
              subtitle: Text("woi kerjain tugas kemaren"),
              trailing: Text("50+", 
              style: TextStyle(
                color: Colors.green
              ),
              ),
            ),
          ),

          Card(
            elevation: 5,
            child:  ListTile(
              leading: Icon(Icons.person),
              title: Text("Ahmad ganteng"),
              subtitle: Text("woi kerjain tugas kemaren"),
              trailing: Text("50+", 
              style: TextStyle(
                color: Colors.green
              ),
              ),
            ),
          ),
              ],
            ),
            // status
            Column(
              children: [
                Card(
            elevation: 5,
            child:  ListTile(
              leading: Icon(Icons.add),
              title: Text("Status saya"),
              subtitle: Text("Ketuk untuk mendapatkan status"),
            ),
          ),
              ],
            ),
          // telepon
          Column(
              children: [
                Card(
            elevation: 5,
            child:  ListTile(
              leading: Icon(Icons.person),
              title: Text("Ahmad Ganteng"),
              subtitle: Text("hari ini jam 11.22"),
              trailing: Icon(Icons.call)
            ),
          ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}