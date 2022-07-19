// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'button.dart';

class Parameters extends StatefulWidget {
  const Parameters({Key? key}) : super(key: key);

  @override
  State<Parameters> createState() => _ParametersState();
}

class _ParametersState extends State<Parameters> {
  //var color1 = Color(0xFFff1616);
  //var color2 = Colors.white;
  var type1_colors = [Color(0xFFff1616), Colors.white];
  var type2_colors = [Color(0xFFff1616), Colors.white];
  //var is_change1 = false;
  //var is_change2 = false;
  var is_visible = false;
  List<String> teethItems = ['1', '2', '3', '4'];
  String? selectedTeeth;
  List<String> unitItems = ['Cm', 'Inch', 'Pouce'];
  String? selectedUnit;
  List<String> wheelItems = ['13', '14', '15'];
  String? selectedWheel;

  void changeColor(List colors) {
    var auxcolor;
    setState(() {
      auxcolor = colors[0];
      colors[0] = colors[1];
      colors[1] = auxcolor;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.maybeOf(context)!.size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFf5f5f5),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Serial Number',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    //controller: TextEditingController(text: "....-....-....-...."),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your serial number',
                        helperText:
                            'Please respect the following format: ....-....-....-....'),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.05),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Diameter of Front Wheel',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: Text(
                      'Unit',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Select a value',
                      ),
                      icon: Icon(Icons.expand_more, color: Colors.grey),
                      //value: selectedTeeth!.isNotEmpty ? selectedWheel : null,
                      items: wheelItems
                          .map((item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      onChanged: (item) => setState(() => selectedWheel = item),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Select the unit'),
                    icon: Icon(Icons.expand_more, color: Colors.grey),
                    //value: selectedUnit!.isNotEmpty ? selectedUnit : null,
                    items: unitItems
                        .map((item) =>
                            DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (item) => setState(() => selectedUnit = item),
                  ))
                ],
              ),
              SizedBox(height: screenSize.height * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Speed Sensor',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyButton(
                          boxWidth: screenSize.width * 0.35,
                          boxColor: type1_colors[1],
                          text: 'Type 1',
                          textColor: type1_colors[0],
                          boxfunc: () {
                            changeColor(type1_colors);
                            is_visible = type1_colors[0] == Colors.white;
                          }),
                      MyButton(
                          boxWidth: screenSize.width * 0.35,
                          boxColor: type2_colors[1],
                          text: 'Type 2',
                          textColor: type2_colors[0],
                          boxfunc: () {
                            changeColor(type2_colors);
                          })
                    ],
                  )
                ],
              ),
              SizedBox(height: screenSize.height * 0.05),
              Visibility(
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: Column(
                  children: [
                    Text(
                      'Teeth Number',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Select a value'),
                      icon: Icon(Icons.expand_more, color: Colors.grey),
                      //value: selectedTeeth!.isNotEmpty ? selectedTeeth : null,
                      items: teethItems
                          .map((item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      onChanged: (item) => setState(() => selectedTeeth = item),
                    )
                  ],
                ),
                visible: is_visible,
              ),
              SizedBox(height: screenSize.height * 0.05),
              MyButton(
                  boxWidth: screenSize.width * 0.6,
                  boxColor: Color(0xFFff1616),
                  text: 'Next',
                  textColor: Colors.white,
                  boxfunc: () {})
            ],
          ),
        ),
      ),
    );
  }
}
