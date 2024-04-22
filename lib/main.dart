import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      title: 'My First Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> colorVariant = [
    Colors.amber,
    Colors.pink,
    Colors.green,
    Colors.purple,
    Colors.indigo
  ];

  int index = 0;

  Color? containerColor;

  @override
  void initState() {
    super.initState();
    containerColor = colorVariant[index]; // 0 -> Amber
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('My App Bar'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add)),
      drawer: Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                height: 140,
                width: 140,
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green
                        )
                    ),
                    hintText: 'Type @ to mention',
                    hintStyle: TextStyle(
                        fontSize: 16
                    )
                ),
              ),
              const SizedBox(height: 12,),
              const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green
                        )
                    ),
                    hintText: 'Type @ to mention',
                    hintStyle: TextStyle(
                        fontSize: 16
                    )
                ),
              ),
              const SizedBox(height: 24,),
              ElevatedButton(onPressed: (){
                if(index >= 4){
                  index = 0;
                } else {
                  index++;
                }
                containerColor = colorVariant[index];
                setState(() {});
              }, child: Text("Click Me"))
            ],
          ),
        )
      ),
    );
  }
}