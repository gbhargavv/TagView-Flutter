import 'package:flutter/material.dart';
import 'package:tag_view/tag_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tagview',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;
  late List<String> _tags;
  String _validateError = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _tags = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Tag View', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: 'Enter Tag',
                errorText: _validateError.length > 0 ? _validateError : null,
              ),
              onSubmitted: (value) {
                setState(() {
                  var s = value.replaceAll(" ", "");
                  if (value.length == 0 || s.length == 0){
                    _validateError = 'Enter Tag';
                    _controller.text = '';
                  } else if (_tags.contains(value))
                    _validateError = 'Tag Already added!';
                  else {
                    _validateError = '';
                    _tags.add(value);
                    _controller.clear();
                  }
                });
              },
            ),
            SizedBox(height: 20),
            TagView(_tags,
                isEnableDelete: true,
                tagBackgroundColor: Colors.blue,
                tagTextColor: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                onDelete: (deletePos) {
                  setState(() {
                    _tags.removeAt(deletePos);
                  });
                }, onClick: (clickPos) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(_tags[clickPos].toString())));
                }),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                setState(() {
                  _tags.clear();
                });
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text('Clear Tags',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            )
          ],
        ),
      ),
    );
  }
}