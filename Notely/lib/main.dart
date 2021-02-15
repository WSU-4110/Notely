import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Notely'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SearchBar searchBar; //Search bar object
  nothing() {}

  //Function that builds the appbar and returns it.
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text(widget.title),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  //Constructor for this instantiates searchBar
  _MyHomePageState() {
    searchBar = new SearchBar(inBar: false, setState: setState, onSubmitted: print, buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context), //Appbar in scaffold is built here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: nothing,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
