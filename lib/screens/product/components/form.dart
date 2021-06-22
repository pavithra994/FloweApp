import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:uuid/uuid.dart';

final List<Map<String, dynamic>> types = [
  {
    'value': 'Rose',
    'label': 'Rose',
    // 'enable': false,
  },
  {
    'value': 'Orchid',
    'label': 'Orchid',
  },
  {
    'value': 'Gardenias',
    'label': 'Gardenias',
  },
];

class FlowerForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlowerFormState();
    // return Container(color: kPrimaryColor // This is optional
    //     );
  }
}

class FlowerFormState extends State<FlowerForm> {
  TextEditingController name = new TextEditingController();
  TextEditingController type = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController imgurl = new TextEditingController();
  String _name;
  String _type;
  String _description;
  String _imgurl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      controller: name,
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 200,
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

  Widget _buildType() {
    return SelectFormField(
      controller: type,
      type: SelectFormFieldType.dropdown,
      labelText: 'Select the type',
      items: types,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Type is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _type = value;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      controller: description,
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _description = value;
      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      controller: imgurl,
      decoration: InputDecoration(labelText: 'ImgUrl'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'ImgURL is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _imgurl = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Form Demo")),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildType(),
                _buildDescription(),
                _builURL(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () async {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    // _formKey.currentState.save();
                    Map<String, dynamic> data = {
                      "title": name.text,
                      "type": type.text,
                      "description": description.text,
                      "image": imgurl.text,
                    };
                    await FirebaseFirestore.instance
                        .collection("item")
                        .add(data);
                    print(_name);
                    print(_type);
                    print(_imgurl);
                    print(_description);
                    await CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      text: "Record added successfully!",
                    );
                    _formKey.currentState.reset();
                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
