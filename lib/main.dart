import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation Basics',
    home: new FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Launch new screen'),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
          child: new RandomWords()
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = new List<String>.generate(200, (i) => "Item $i");
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final list = ["111 one", "222 two", "333 three", "444 four","111 one", "222 two", "333 three", "444 four","111 one", "222 two", "333 three", "444 four","111 one", "222 two", "333 three", "444 four"];
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          return _buildRow(i, _suggestions[i]);
        }
    );
  }

  Widget _buildRow(int i, String text) {
    return new ListTile(
      title: new Row(children: <Widget>[
        Text(i.toString()),
        for(var item in list ) _containerText(item)

      ],)
    );
  }

  Widget _containerText(String text){
    return Container(
      margin: EdgeInsets.only(left: 5, top: 5),
      //设置 child 居中
      alignment: Alignment(0, 0),
      // height: 50,
      // width: 300,
      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        //设置四周边框
        border: new Border.all(width: 1, color: Colors.red),
      ),
      child: Column(children: <Widget>[Text(text),Text(text),Text(text),Text(text)],),
    );
  }
}