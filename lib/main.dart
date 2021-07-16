import 'package:flutter_bootcamp_capstone/models/starships.dart';
import 'package:flutter_bootcamp_capstone/widgets/starshipCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Ships',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Star Wars Ships List',
        key: null,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<String> _loadRemoteData() async {
  final response = await (http
      .get(Uri.parse('https://api.jsonbin.io/b/60f1d0e0a917050205c8fa9a/2')));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Not able to pull the data.');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Starships> fetchQuests() async {
    String jsonString = await _loadRemoteData();

    final List<dynamic> jsonResponse = json.decode(jsonString);

    Starships starships = new Starships.fromJson(jsonResponse);

    return starships;
  }

  late Future<Starships> starships;

  @override
  void initState() {
    super.initState();
    starships = fetchQuests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<Starships>(
          future: starships,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.dataModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data!.dataModel[index].name),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StarshipCard(
                                  snapshot.data!.dataModel[index].name,
                                  snapshot.data!.dataModel[index].manufacturer,
                                  snapshot.data!.dataModel[index].crew,
                                  snapshot.data!.dataModel[index].passengers,
                                  snapshot.data!.dataModel[index]
                                      .hyperdriveRating)));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
