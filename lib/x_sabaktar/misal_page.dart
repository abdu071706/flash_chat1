import 'package:flutter/material.dart';

import 'misal_eki.dart';

const constOzgorboit = 'Baraktar';

class MisalPage extends StatefulWidget {
  const MisalPage({
    this.finalName,
    this.akyrkyBaa,
    Key ?key,
  }) : super(key: key);

  final String? finalName;
  final int? akyrkyBaa;
  @override
  _MisalPageState createState() => _MisalPageState();
}

class _MisalPageState extends State<MisalPage> {
  // Strongly Typed Language - strogo tipizirovannyi yazik
  // var baa = 3;
  String _name = 'Janibek';
  int _baa = 3;

  @override
  void initState() {
    changeName();
    super.initState();
  }

  Future<void> changeName() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {});
    _name = 'Jakyp';
    _baa = 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(constOzgorboit),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Text(' Final emes ', style: TextStyle(fontSize: 45.0)),
          ),
          InkWell(
              onDoubleTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisalEki()));
              },
              child: Text(
                'Const',
                style: TextStyle(fontSize: 45.0),
              )),
          Text(
            _name,
            style: TextStyle(fontSize: 45.0),
          ),
          Text(
            _baa.toString(),
            style: TextStyle(fontSize: 45.0),
          ),
          SizedBox(
            child: Text(' Final ', style: TextStyle(fontSize: 45.0)),
          ),
          SizedBox(
            child: Divider(color: Colors.red),
          ),
          Text(
            widget.finalName!,
            style: TextStyle(fontSize: 45.0),
          ),
          Text(
            widget.akyrkyBaa.toString(),
            style: TextStyle(fontSize: 45.0),
          ),
        ],
      )),
    );
  }
}
