import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DptQuestion.dart';
import 'MyHomePage.dart';

class DepartmentPage extends StatefulWidget {
  static const String id = "Department Page";
final WheelNumber;
DepartmentPage(this.WheelNumber);
  @override
  _DepartmentPageState createState() => _DepartmentPageState(this.WheelNumber);
}

class _DepartmentPageState extends State<DepartmentPage> {

  _DepartmentPageState(wheelNumber);


  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names

    String DataLabel = RouletteScore.SpinLabel;
    var ListIndex = int.parse(DataLabel);

    // second Technical content writing page

    // ignore: non_constant_identifier_names
    Map<String, String> DataQuestion = Questions.question_List[ListIndex - 1];
    // ignore: non_constant_identifier_names
    String questionCse = DataQuestion['Qst cse'];
    String GeneralCse = DataQuestion['General cse'];
    String SituationalCse = DataQuestion['Situational-Cse'];
    TextEditingController questioCse = new TextEditingController();
    TextEditingController generalCse = new TextEditingController();
    TextEditingController situationaCse = new TextEditingController();

    String Data = DataQuestion.toString();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Text(questionCse),
                  TextField(controller: questioCse,),
                  Text(GeneralCse),
                  TextField(controller: generalCse,),
                  Text(SituationalCse),
                  TextField(controller: situationaCse,),
                ]
            ),
        ),
    );
  }
}
