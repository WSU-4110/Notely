import 'dart:collection';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

List<String> notifications = [
  ("Sample notification 1"),
  ("Sample notification 2"),
  ("Sample notification 3"),
  ("Sample notification 4"),
  ("Sample notification 5"),
  ("Sample notification 6"),
];

class Graph{
  final Map<int, Set<int>> adjacencyList = Map<int, Set<int>>();

  void addEdge(int source, int target){
    if(adjacencyList.containsKey(source)){
      adjacencyList[source].add(target);
    }
    else{
      adjacencyList[source] = {target};
    }
  }
}

abstract class TreeCol{
  TreeIterator createIterator();
  String getTitle();
}

class BreadthCol implements TreeCol{
  final Graph graph;

  const BreadthCol(this.graph);

  @override
  TreeIterator createIterator(){
    return BIterator(this);
  }

  @override
  String getTitle() {
    throw UnimplementedError();
  }
}

abstract class TreeIterator{
  bool hasNext();
  int getNext();
  void reset();
}

class BIterator implements TreeIterator{
  final BreadthCol treeCollection;
  final Set<int> visitedNodes = <int>{};
  final ListQueue<int> nodeQueue = ListQueue<int>();

  final int _initialNode = 1;
  int _currentNode;

  BIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeQueue.add(_initialNode);
  }

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  bool hasNext() {
    return nodeQueue.isNotEmpty;
  }

  @override
  int getNext() {
    if (!hasNext()) {
      return null;
    }

    _currentNode = nodeQueue.removeFirst();
    visitedNodes.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      for (var node in adjacencyList[_currentNode]
          .where((n) => !visitedNodes.contains(n))) {
        nodeQueue.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeQueue.clear();
    nodeQueue.add(_initialNode);
  }
}
        
// The following classes demonstrates visually how the iterator can parse through the different notifications
class Noti extends StatefulWidget{
  @override
  _NotiState createState() => _NotiState();
}

class _NotiState extends State<Noti>{
  final List<TreeCol> treeCollections = List<TreeCol>();
  int _selectedTreeColIndex = 0;
  int _currentNodeIndex = 0;
  bool _isTraversing = false;

  @override
  void initState(){
    super.initState();

    var graph = _buildGraph();
    treeCollections.add(BreadthCol(graph));
  }

  Graph _buildGraph(){
    var graph = Graph();

    graph.addEdge(1,2);
    graph.addEdge(1,3);
    graph.addEdge(1,4);
    graph.addEdge(2,5);
    graph.addEdge(3,6);
    graph.addEdge(3,7);
    graph.addEdge(4,8);

    return graph;
  }

  void _setSelectedTreeColIndex(int index){
    setState((){
      _selectedTreeColIndex = index;
    });
  }

  Future _traverseTree() async{
    _toggleIsTraversing();

    var iterator = treeCollections[_selectedTreeColIndex].createIterator();

    while (iterator.hasNext()){
      setState((){
        _currentNodeIndex = iterator.getNext();
      });
      await Future.delayed(const Duration(seconds: 1));
    }
    _toggleIsTraversing();
  }

  void _toggleIsTraversing(){
    setState((){
      _isTraversing = !_isTraversing;
    });
  }

  void _reset(){
    setState((){
      _currentNodeIndex = 0;
    });
  }
  Color _getBackgroundColor(int index) {
    return _currentNodeIndex == index ? Colors.red[200] : Colors.white;
  }
  
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            TreeColSelection(
              treeCollections: treeCollections,
              selectedIndex: _selectedTreeColIndex,
              onChanged:
                  !_isTraversing ? _setSelectedTreeColIndex : null,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                PlatformButton(
                  child: Text('Traverse'),
                  materialColor: Colors.black,
                  materialTextColor: Colors.white,
                  onPressed: _currentNodeIndex == 0 ? _traverseTree : null,
                ),
                PlatformButton(
                  child: Text('Reset'),
                  materialColor: Colors.black,
                  materialTextColor: Colors.white,
                  onPressed:
                      _isTraversing || _currentNodeIndex == 0 ? null : _reset,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Box(
              nodeId: 1,
              color: _getBackgroundColor(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Box(
                    nodeId: 2,
                    color: _getBackgroundColor(2),
                    child: Box(
                      nodeId: 5,
                      color: _getBackgroundColor(5),
                    ),
                  ),
                  Box(
                    nodeId: 3,
                    color: _getBackgroundColor(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Box(
                          nodeId: 6,
                          color: _getBackgroundColor(6),
                        ),
                        Box(
                          nodeId: 7,
                          color: _getBackgroundColor(7),
                        ),
                      ],
                    ),
                  ),
                  Box(
                    nodeId: 4,
                    color: _getBackgroundColor(4),
                    child: Box(
                      nodeId: 8,
                      color: _getBackgroundColor(8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
  class Box extends StatelessWidget {
  final int nodeId;
  final Color color;
  final Widget child;

  const Box({
    @required this.nodeId,
    @required this.color,
    this.child,
  })  : assert(nodeId != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
  }
  class TreeColSelection extends StatelessWidget {
  final List<TreeCol> treeCollections;
  final int selectedIndex;
  final ValueSetter<int> onChanged;

  const TreeColSelection({
    @required this.treeCollections,
    @required this.selectedIndex,
    @required this.onChanged,
  })  : assert(treeCollections != null),
        assert(selectedIndex != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < treeCollections.length; i++)
          RadioListTile(
            title: Text(treeCollections[i].getTitle()),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
class PlatformButton extends StatelessWidget {
  final Widget child;
  final Color materialColor;
  final Color materialTextColor;
  final VoidCallback onPressed;
  const PlatformButton({
    @required this.child,
    @required this.materialColor,
    @required this.materialTextColor,
    this.onPressed,
  })  : assert(child != null),
        assert(materialColor != null),
        assert(materialTextColor != null);

  @override
   Widget build(BuildContext context) {
    return Platform.isAndroid
        ? MaterialButton(
            child: child,
            color: materialColor,
            textColor: materialTextColor,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.white,
            onPressed: onPressed,
          )
        : CupertinoButton.filled(
            child: child,
            onPressed: onPressed,
          );
  }
}