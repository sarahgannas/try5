import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _stID;
  String _age;
  String _semister;
  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: ' Student Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }



  Widget _buildstID() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Student ID'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'ID is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _stID = value;
      },
    );
  }

  Widget _builage() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Age is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget _buildsemister() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Semister'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Semister is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
             _buildstID(),
              _builage(),
             _buildsemister(),
              SizedBox(height: 100,
              width: 300,),
              RaisedButton(
                child: Text(
                  'Create Student',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(_name);
                  print( _stID);
                  print(_age);
                  print(_semister);

                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
 