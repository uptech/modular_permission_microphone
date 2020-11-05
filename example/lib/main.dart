import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  bool _granted = false;
  MethodChannel _channelMicrophone =
      MethodChannel('ch.upte.modularPermissionsMicrophone');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Modular Microphone Permission'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                borderSide: BorderSide(color: Colors.red),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Check Microphone Permission',
                    style: Theme.of(context).textTheme.button,
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () async {
                  final String info = await _channelMicrophone
                      .invokeMethod('checkMicrophonePermission');
                  setState(() {
                    _granted = info == "granted";
                  });
                },
              ),
              OutlineButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                borderSide: BorderSide(color: Colors.red),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Request Microphone Permission',
                    style: Theme.of(context).textTheme.button,
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () async {
                  final String info = await _channelMicrophone
                      .invokeMethod('requestMicrophonePermission');
                  setState(() {
                    _granted = info == "granted";
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Microphone Permission is ${_granted ? 'granted' : 'not granted'}',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
