// import 'package:flutter/cupertino.dart';
// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: CupertinoThemeData(brightness: Brightness.light),
        home: TampilAlertDialog());
  }
}

class TampilAlertDialog extends StatefulWidget {
  TampilAlertDialog({Key? key}) : super(key: key);

  @override
  State<TampilAlertDialog> createState() => _TampilAlertDialogState();
}

class _TampilAlertDialogState extends State<TampilAlertDialog> {

  double _currentSliderValue = 20;

  double _currentSliderValueCup = 30;

  bool light = true;
  bool wifi = true;

  
  String? _sliderStatus;

  int pilihIndex = 0;

  DateTime pilihTanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Material & Cupertino")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Date Picker",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DatePickerDialog(
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1999),
                            lastDate: DateTime(2023));
                      });
                },
                child: Text(
                  "Material",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              CupertinoButton(
                  color: Colors.blue,
                  child: Text("Cupertino",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 300,
                            child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: DateTime.now(),
                                backgroundColor: Colors.white,
                                onDateTimeChanged: (tanggal) {
                                  print(tanggal);
                                  setState(() {
                                    pilihTanggal = tanggal;
                                  });
                                }),
                          );
                        });
                  }),
            ],
          ),
          Text(
            "Hari, tanggal dan bulan : ${DateFormat.yMd().format(pilihTanggal)}",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(" "),
          Text(" "),
          Text(" "),
          Text(" "),
          Text(
            "Slider",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "Material",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: _currentSliderValue,
            max: 100,
            divisions: 5,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Text(
            "Cupertino",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
   
          Text('$_currentSliderValueCup'),
            CupertinoSlider(
              key: const Key('slider'),
              value: _currentSliderValueCup,
              // This allows the slider to jump between divisions.
              // If null, the slide movement is continuous.
              divisions: 5,
              // The maximum slider value
              max: 100,
              activeColor: CupertinoColors.systemPurple,
              thumbColor: CupertinoColors.systemPurple,
              // This is called when sliding is started.
              onChangeStart: (double value) {
                setState(() {
                  _sliderStatus = 'Sliding';
                });
              },
              // This is called when sliding has ended.
              onChangeEnd: (double value) {
                setState(() {
                  _sliderStatus = 'Finished sliding';
                });
              },
              // This is called when slider value is changed.
              onChanged: (double value) {
                setState(() {
                  _currentSliderValueCup = value;
                });
              },
            ),
            Text(
              _sliderStatus ?? '',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 12,
                  ),
            ),



          Text(" "),
          Text(" "),
          Text(" "),
          Text(" "),
          Text(
            "Switch",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "Material",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Switch(
            value: light,
            activeColor: Colors.red,
            onChanged: (bool value) {
              setState(() {
                light = value;
              });
            },
          ),
          Text(
            "Cupertino",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),

          CupertinoSwitch(
                // This bool value toggles the switch.
                value: wifi,
                thumbColor: CupertinoColors.systemBlue,
                trackColor: CupertinoColors.systemRed.withOpacity(0.14),
                activeColor: CupertinoColors.systemRed.withOpacity(0.64),
                onChanged: (bool? value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    wifi = value!;
                  });
                },
              )
        ],
      )),
    );
  }
}