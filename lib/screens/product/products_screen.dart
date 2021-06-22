import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flower_app/constants.dart';

import '../product/components/body.dart';
import 'components/add_product.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddProduct(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text('FLORA'),
    );
  }
}
