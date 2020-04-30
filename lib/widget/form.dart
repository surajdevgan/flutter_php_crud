import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
class AppForm extends StatefulWidget {
  // Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  // Handles text onchange
  TextEditingController nameController;
  TextEditingController ageController;
  var languages = ['Java','Python', 'Dart'];

  String currentItemSelected = "Java";

  void initState() {

    currentItemSelected = "Java";
  }



  AppForm({this.formKey, this.nameController, this.ageController});




  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {


  String _validateName(String value) {
    if (value.length < 3) return 'Name must be more than 2 charater';
    return null;
  }


  String _validateAge(String value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) return 'Age must be a number';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Name'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Age'),
            validator: _validateAge,
          ),

          Text(

            "Select your favourite language"+widget.currentItemSelected
          ),



          DropdownButton<String>(


            items: widget.languages.map((String dropDownStringItem){

              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                 child: Text(dropDownStringItem),

              );
            }).toList(),

           onChanged: (String newValueSelected){
              setState(() {
                this.widget.currentItemSelected = newValueSelected;
              });


},
            hint: Text('Select one'),
            value: widget.currentItemSelected



          ),

        ],


      ),

      );

  }
}