import 'package:flutter/material.dart';

void main() =>runApp(new MaterialApp(
  home: new AppHome(),
));

class AppHome extends StatefulWidget{
  @override
  State<AppHome> createState() {
    return new AppState();
  }
}

class AppState extends State<AppHome>{
  List<String>  groups = ['Group A','Group B','Group C'];

  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("CET Students"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,

        child: Text('  ADD  '),
      ),


      body: new Container(
        child: new ListView.builder(
          reverse: false,
          itemBuilder: (_,int index)=>EachList(this.groups[index]),
          itemCount: this.groups.length,
        ),
      ),
    );

  }

  void onPressed() {


    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("New Group Name?"),
          content: Container(
            width: 250,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40)),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                suffixIcon: Icon(Icons.group),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          actions : <Widget>[
            RaisedButton(
              child: Text("Save"),
              color: Colors.blue,
              onPressed: () {
                setState(() => groups.add(controller.text));
                controller.clear();
                Navigator.of(context).maybePop();
              },
            ),
            RaisedButton(
              child: Text("Done"),
              color: Colors.blue,
              onPressed: () {
                controller.clear();
                Navigator.of(context).maybePop();
              },
            )
          ],
        ));


  }

}
class EachList extends StatelessWidget{
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(child: new Text(name[6]),),
            new Padding(padding: EdgeInsets.only(right: 10.0)),
            new Text(name,style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

}

